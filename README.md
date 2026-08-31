# UT2004 Archive — VitalOverdose

Everything that survives of my Unreal Tournament 2004 modding work, 2003–2005,
plus a 2026 return visit. Two drives were lost to GandCrab ransomware; this is
the salvage, published so it can't be lost — or claimed by anyone else — again.

## Claims, with the evidence in this repo

- **Inventor of the VTM (Variable Timed Mover)** — a mover with per-keyframe
  speed control instead of the engine's single `MoveTime`. It turned BSP movers
  from doors into animation curves, and it's the primitive everything else here
  is built on. Lineage in the source: `SC_VTM.uc` → `FD_VTM` → `FD_VTMover`
  (file dates September–October 2005).
- **First person to make a working vehicle dropship** for UT2004 — a Karma
  vehicle carried by, and cleanly released from, another vehicle. On the
  community's "can't be done" list at the time. Still tinkering with it in 2026
  (`DropShip/`).
- **First person to make a working vehicle teleporter** — a vehicle passing
  through a teleporter with its physics state, occupants and momentum intact.
  Also from the "can't be done" list.
- **SpiderCore** *(unfinished)* — Onslaught power cores encased in giant
  mechanical spiders with segmented, choreographed legs. A central brain script
  compiles mapper-authored kick sequences into packed binary command words
  (5 actions × 4 timeframes per leg segment, encoded in a 20-bit integer) and
  distributes them to the leg movers, which decode on the fly. A declarative
  animation DSL with its own wire format, written in UnrealScript in 2005.

- **The Dolls House Effect** *(kept secret 2005-2026)* — `Maps_2026/DM-DollsHouseEffect2026.ut2`.
  A recursive multi-scale deathmatch: the arena is a diorama, the diorama's tiny
  house leads to a "full-size" house where you arrive mouse-sized, and the loop
  closes back at the start room. The player never changes scale - the world does.
  The colossal live "gods" overhead are not built geometry and not a projection:
  the arena's SkyZoneInfo camera sits inside the playable start room, so ordinary
  players render as full-resolution titans in the sky. No engine tricks were
  harmed: brushwork, teleporters, and one repurposed skybox.

## What's in here

| Folder | What it is |
|---|---|
| `zipped backups/Mod Systems/spidercore/SpiderCoreModPack/` | The October 2005 SpiderCore generation — `SpiderBrain.uc` (the binary choreography compiler), `SpiderCoreMover.uc` (the decoder), leg segments, FX classes. Sole surviving copy. |
| `zipped backups/Mod Systems/spidercore/Spider_Core_Mod/` | The September 2005 generation — `FD_V5SpiderBrain.uc` (pre-binary, flat booleans), `SC_VTM.uc`, and `notes.txt`: a hand-built capability matrix of what the engine's vehicle/actor operations actually support. |
| `.../SpiderCoreModPack/VechTech/` | The vehicle framework (79 classes): the `FD_*` family, VTM lineage, kickable Raptor, recoiler launch tubes. |
| `zipped backups/Maps/ons-SPiderCore3/` | The SpiderCore Onslaught map. |
| `Spidercore/` | Textures, meshes and renders — including the StellarCruiser set. |
| `DropShip/` | The 2026 return to the dropship, twenty years on. |
| `zipped backups/unrealwiki-offline/` | The complete UnrealWiki, downloaded in a single internet-café session on 24 September 2005 (every page footer carries the stamp) — grabbed at the start of six months without internet, and the syllabus for everything above. |
| `zipped backups/Mod Systems/.../ManiacRacing, TransCore` | Other mod systems that made it out. |

Also in the fleet-era work: a three-capital-ship space map at a scale where
Epic's ONS-Torlan fits inside a single ship — the wireframe comparison shot is
in the `Pics` folders.

## Provenance

All 2005 file timestamps are original. The work was written solo. Some of it
was uploaded to the UnrealWiki in 2005 immediately before the author went
offline for six months; attribution of the VTM there was subsequently...
edited. The file dates, naming conventions (`FD_`, `SC_`), comment voice and
the follow-on systems that only the original author could build are all here,
which is the long way of saying: provenance is what a filesystem is for.

A few files over GitHub's 100 MB limit (Substance working files, a texture
installer) are excluded from the repo but preserved in the offline mirrors.

— David Winship (VitalOverdose), archived August 2026
