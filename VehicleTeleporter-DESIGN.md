# The Vehicle Teleporter / DropShip — why the order is the only order

*The design knowledge behind `VOD_VehicleTeleporter.uc` and the dropship's
capture/release system. The code shows what happens; this records why it
happens in this sequence — because the sequence is not a style choice, it is
the only ordering that works. Reconstructed in 2026 from the author's memory
and the code; where memory and source disagree, the source is the tie-breaker.*

The problem was on the community's "can't be done" list because everyone
attacked it as one problem. It is six problems, and each one is a gate that
must be passed before the next even exists. The plan came first; the method
for each gate came from crawling the engine source function by function until
it confessed where the seams were.

## The six gates, in order

**1. Physics off first.** `SetLocation()` on a live Karma body is the
explode-on-arrival everyone else got: the solver treats a huge displacement
as an infinite-velocity collision and tears the vehicle apart. So the vehicle
must *leave the physics world* (`SetPhysics(PHYS_None)`) before it moves.
This is the discovery the whole system hangs off — do not "optimise" it away.

**2. Then teleport.** Trivial once gate 1 exists; impossible before it. The
"trick" everyone hunted for was actually two tricks in the right order.

**3. Then direction, while still weightless.** Set the hull's rotation to the
exit's rotation *before* physics comes back, so Karma wakes already facing
the right way instead of fighting a rotation snap on a live body.

**4. Then restore physics, then the kick.** An impulse applied under
`PHYS_None` does nothing — the kick only means anything once the body is back
in the physics world. The old momentum is meaningless after the jump, so
velocity is captured in the vehicle's own frame on entry
(`Velocity << Rotation`), scaled by the multiplier, and re-applied through
the **exit's** rotation (`>> Exit.Rotation`): vehicles leave the portal at
speed, along the portal's heading. Portal-relative momentum.

**5. Then the bot lock — and its duration matters.** A bot experiences the
teleport as "everything I know is wrong" and its panic response is to eject.
The lock (`bDriverCannotLeaveVehicle`) is anaesthesia, not restriction: held
in for a tuned window (`BotLockDuration`) while `MoveTimer = -1` and a new
move target force the AI to re-path. Too short and bots still bail; the
duration is gameplay-tuned, not arbitrary.

**6. Last and hardest: the controller view.** UT2004 runs *two* orientations
— the hull's and the controller's — and the input/camera frame hangs off the
controller. Sync the hull but not the controller and the player exits the
portal steering in the old world's coordinates with the camera twisted. It
never crashes; it just "feels broken", which is why it was the hardest gate
to find. `VehicleRef.Controller.SetRotation()` alongside the hull's rotation
is load-bearing.

## The supporting rules

- **The exit must be checked before use.** A destination is only offered if
  the vehicle actually fits (`PickRandomDestination` tests against the
  vehicle's collision radius). Blocked exits are skipped; if all are blocked,
  no teleport. Some versions instead *kick whatever is squatting on the exit
  point* out of the way — both policies existed; choose per map.
- **Exits can be randomised.** Multiple destination actors share a tag; the
  system picks among the clear ones. One entry, many possible exits.
- **The dropship shares gate 1.** Cargo capture is the same sidestep:
  `PHYS_None` + `SetBase(ship)` + collision off — the engine's own
  base-following does the carrying, and the Karma constraint solver never
  sees the pair. Release reverses it exactly; weight is simulated by nudging
  `KActorGravScale` per vehicle carried.

## The method, for the record

Plan first. Then read the engine source, function by function, until the
undocumented seams are found. Then order the operations so each one runs in
the state the previous one created. The order *is* the invention — anyone
who reorders these calls while "cleaning up" will rediscover, one by one,
every explosion this system was built to avoid.

— David Winship (VitalOverdose), written down August 2026
