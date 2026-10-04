# Claude Production Build Prompt — $ackReligious: Memphis

You are taking over active production development of **$ackReligious: Memphis**.

This is not a throwaway prototype. Treat this as a serious production pass toward a cohesive commercial-quality game that can ultimately work on desktop, mobile, and console-style controls.

## Repositories

**Primary game repository**
https://github.com/Tre2k3/blue-delta-palm-craft

**Private Claude production-reference repository**
https://github.com/Tre2k3/SackReligious-Game-Claude

The private reference repository contains the visual/technical production packs under:

`reference-packs/`

Expected packs:

1. `SackReligious_Character_Bible_AI_Reference_Pack.zip`
2. `SackReligious_Console_Quality_Game_Concepts.zip`
3. `SackReligious_World_Buildings_Reference_Pack_v1.zip`
4. `SackReligious_HQ_Production_Reference_Pack_v1.zip`
5. `SackReligious_Vehicle_Street_Systems_Production_Pack_v1.zip`
6. `SackReligious_Gameplay_Props_Items_Production_Pack_v1.zip`
7. `SackReligious_UI_HUD_Production_Pack_v1.zip`
8. `SackReligious_Activity_Locations_Production_Pack_v1.zip`

Use those packs as the primary visual and production reference. Unzip and inspect them before making major visual decisions.

Do not casually redesign the game from scratch.

Do not merge directly into `main`.

Create a new production branch from the best current base after auditing the repository.

Suggested branch:
`feat/claude-production-rebuild`

If another active branch clearly contains newer functional work that should be preserved, inspect it first and explain why you are branching from it.

Known historical branches/commits may include:
- `fix/world-collision-road-traffic`
- `feat/halloween-after-dark`

Do not assume those are current or correct. Inspect them.

---

# PRIMARY PRODUCT GOAL

Transform the current project into a polished Memphis lifestyle/open-world game built around SackReligious culture, fashion, activities, local environments, and progression.

The finished game should support:

- third-person / 2.5D exploration
- walkable Memphis-inspired streets
- believable road layouts
- lane-following traffic
- real collision
- enterable buildings
- shops
- clothing/wardrobe
- SackDollars
- Respect/progression
- missions
- NPCs
- basketball
- fishing
- bowling
- racing
- food-truck interactions
- seasonal events
- day/night presentation
- desktop keyboard
- controller-style input
- mobile touch input
- responsive UI
- save/load
- polished transitions
- reasonable performance

Structurally, the intended quality target is closer to a dense AA city/activity game than an enormous AAA open world.

Useful structural comparisons only:
- Like a Dragon / Yakuza: dense city, interiors, side activities, recurring characters
- NBA 2K City: basketball, clothing, reputation, shopping, lifestyle hub
- GTA-style world structure: driving, exploration, businesses, missions
- strongly stylized urban presentation instead of requiring photorealistic AAA scope

Do not copy copyrighted assets, maps, characters, UI, audio, code, or exact level designs from those games.

---

# FIRST RULE: AUDIT BEFORE REWRITE

Do not begin with a giant rewrite.

First:

1. Clone/open the primary game repository.
2. Inspect repository structure.
3. Inspect package configuration and build scripts.
4. Run the current game.
5. Test the current build manually.
6. Inspect major branches that may contain unmerged useful work.
7. Clone/open the private reference repository.
8. Unzip and inspect all production-reference packs.
9. Determine what already works.
10. Determine what is broken.
11. Determine what is placeholder.
12. Determine what should be preserved.
13. Determine what requires architectural repair.

Create:

`docs/CLAUDE_PRODUCTION_AUDIT.md`

It must cover:

- rendering stack
- world architecture
- player controller
- player visual/sprite system
- camera
- collision
- world/road system
- traffic
- NPC/pedestrian system
- interaction system
- building/interior transitions
- basketball
- fishing
- bowling
- racing
- wardrobe/outfit compositing
- inventory/economy
- missions
- save/load
- input
- mobile controls
- UI/HUD
- asset-loading strategy
- performance risks
- build/lint/typecheck status
- known broken assets
- dead code / duplicate systems
- placeholder systems
- production risks

Also create:

`docs/CLAUDE_PRODUCTION_PLAN.md`

The plan must divide work into safe phases and identify which existing code should be preserved versus replaced.

Do not claim the game is rebuilt before these documents exist.

---

# VISUAL AUTHORITY

The private reference packs are the visual authority.

Use them as:
- architectural references
- environment references
- character references
- prop references
- vehicle references
- layout references
- lighting references
- UI references
- activity references

Do not simply place giant concept images behind gameplay and call the world complete.

Reference images are art direction and design references, not necessarily runtime textures.

Major locations should become actual playable spaces with:

- collision
- walkable bounds
- entrances
- exits
- interaction anchors
- camera zones
- NPC zones
- gameplay layers
- foreground occluders where appropriate
- lighting/VFX
- save state
- seasonal override hooks

---

# CANONICAL BENJI

Benji is established and must not be redesigned.

Use the Character Bible as authority.

Preserve:

- Black male identity
- established face
- existing tattoos
- forehead cross
- hair/twists/braids
- white/green SackReligious cap where appropriate
- jewelry/chains
- body proportions
- established shoes/footwear identity
- outfit identity

Canonical directional contract:

- A = move LEFT and visually face LEFT
- D = move RIGHT and visually face RIGHT
- W = move away/up-screen and show BACK view
- S = move toward/down-screen and show FRONT view

Do not reverse this mapping.

Player visual rules:

- bottom-center feet pivot
- feet grounded to world plane
- preserve native image aspect ratio
- no raw sprite-sheet rendering
- no black rectangle backgrounds
- no clipped body
- no detached feet
- no floating
- one active Benji visual at a time
- pre-dressed action sprites must not be double-composited with outfits

If an action sprite already contains the outfit, bypass generic outfit compositing for that frame.

Outfit save/load must store the actual equipped outfit.

Missing outfit-specific actions must fall back safely.

---

# CANONICAL K BLANCO

K Blanco is established.

Use the canonical female K Blanco reference in the Character Bible.

She is:

- a Black woman
- platinum/white short vintage curls
- stylish black sleeveless outfit/jumpsuit
- heels
- gold hoops
- layered jewelry
- K pendant
- boutique owner / mentor / Memphis style icon

Do not use the incorrect older male K Blanco concept.

The canonical Character Bible image overrides conflicting generated material.

K Blanco remains a separate NPC and must not be baked into environment art.

---

# WORLD SCALE

Create one consistent world-scale contract.

Benji is the master human-scale reference.

Doors, cars, counters, furniture, sidewalks, curbs, hoops, benches, signs, props, and buildings should all make sense relative to Benji.

Centralize important scale constants instead of manually scaling every asset until it looks acceptable.

Create a dedicated module such as:

`src/game/worldScale.ts`

or equivalent.

---

# PLAYER MOVEMENT + COLLISION

Benji must not ghost through:

- buildings
- walls
- fences
- locked doors
- counters
- large props
- activity barriers

Use explicit collision geometry rather than assuming image bounds are sufficient.

Support a collision debug overlay.

Movement must be smooth and consistent across:
- keyboard
- controller abstraction
- touch controls

Do not create separate contradictory movement logic per device.

---

# CAMERA

The camera must support a polished third-person / 2.5D experience.

Requirements:

- smooth follow
- no violent snapping
- player stays readable
- roads remain readable
- interactions remain visible
- no frequent geometry clipping
- interior camera zones
- activity-specific camera overrides
- mobile-friendly framing
- perspective/scale behavior that remains coherent

Do not build a camera that only works in one location.

---

# ROADS + TRAFFIC — HIGH PRIORITY

This is one of the most important repair areas.

Known past problems included:

- cars driving sideways
- cars driving through buildings
- cars not following lanes
- traffic crossing decorative scenery
- cars clipping curbs/buildings
- roads not visually reading as real roads

Fix the architecture, not only the appearance.

Roads need:

- asphalt surfaces
- lane markings
- double-yellow lines where appropriate
- turn lanes
- stop lines
- intersections
- crosswalks
- sidewalks
- curbs
- driveways
- parking spaces
- parking lots
- alleys
- traffic lights
- road signs
- streetlights
- utility poles
- barriers/fences where appropriate

Traffic should use:
- lane graph, road splines, or another explicit path system
- lane center
- travel direction
- waypoint routing
- intersection state
- parking anchors
- collision awareness
- spawn/despawn rules

Vehicle heading must match actual velocity and the road tangent.

Never rotate a vehicle sideways to fake forward travel.

Vehicles must not pass through:
- buildings
- walls
- fences
- major props
- blocked geometry

Traffic does not initially need AAA driving physics.

Correct lane adherence, heading, collision, turning, parking, and intersection behavior matter more.

Recommended debug:

`window.__SACK_TRAFFIC_DEBUG__`

Show:
- lane centerlines
- current road segment
- route
- target lane
- next waypoint
- heading
- velocity direction
- speed
- collision bounds
- intersection state
- parking anchor

Use the Vehicle + Street Systems Production Pack as the visual/technical authority.

---

# VEHICLES

Canonical categories:

- Benji primary car
- standard traffic sedan
- black SUV
- SackReligious delivery van
- classic coupe
- performance/sports car

Benji's main car should remain consistent with its canonical reference rather than randomly changing models/colors.

Use reference turnarounds to maintain proportion and identity.

Vehicles must visually sit on the road plane with tires contacting the surface.

---

# BUILDINGS + INTERIORS

Priority locations:

1. SackReligious HQ
2. K Blanco boutique
3. Benji home
4. 901 basketball court
5. bowling alley
6. riverfront/fishing
7. racing/car meet
8. food truck zone
9. downtown/culture district
10. neighborhood/residential district
11. haunted house seasonal location

Physical transitions only.

Use:
- doors
- gates
- stairways
- passages
- docks
- activity entrances

Do not use arbitrary coordinate teleports.

If the player enters through a door, leaving should return them to the corresponding real exit anchor.

Every major location should have:
- location ID
- entrance
- exit
- spawn/return anchor
- walkable bounds
- collision bounds
- interaction anchors
- camera zone
- NPC anchors
- mission hooks
- lighting state
- save state
- seasonal override state

Recommended:

`window.__SACK_LOCATION_DEBUG__`

Show all anchors/bounds/location IDs.

---

# SACKRELIGIOUS HQ

Treat the HQ Production Pack as authoritative.

The HQ is a major home base, retail location, and mission hub.

Expected spaces:

- exterior
- front entrance
- showroom
- clothing displays
- jersey/shoe display
- checkout/register
- fitting area
- lounge/VIP space
- management office
- stockroom/backroom
- restroom
- rear loading/service entrance
- optional content studio
- optional conference/creative space

Support:

- shopping
- wardrobe ownership
- deliveries
- K Blanco interactions
- missions
- loading/service missions
- day/night
- 901 Day
- Halloween overlays

Seasonal variants should reuse the same geometry and collision.

Change:
- decorations
- materials
- signage
- lighting
- VFX
- weather
- props

Do not rebuild the entire HQ per season.

---

# BENJI HOME

Create a coherent home location with:

- front exterior
- driveway/parking
- entrance
- living area
- bedroom
- kitchen
- wardrobe/closet hook
- garage if appropriate
- home spawn/save functionality

Use it as a stable home location and safe spawn.

---

# BASKETBALL

Preserve the existing basketball system where structurally sound.

Critical rule:

The basketball is a separate gameplay object.

Never bake the ball into Benji.

Expected ball states:

- idle
- possessed/held
- dribbling
- charging
- released
- airborne
- rim/backboard contact
- bounce
- reboundable
- reset

Required behavior:

- tap shoot
- hold/release shoot
- max-charge safety release
- no permanent stuck state if key-up is missed
- reset when entering/re-entering court
- playable rebound/reset behavior

Visible scoring geometry must match the rim.

Court needs:

- playable bounds
- hoop
- backboard
- rim/net
- fence
- bleachers
- scoreboard
- entrance
- spectator-safe areas
- practice state
- mission/tournament hooks

Preserve/improve existing diagnostics if available.

---

# FISHING

Fishing equipment remains separate:

- rod
- line
- bobber
- lure/hook
- fish

Use explicit fishing anchors rather than allowing fishing from any shoreline coordinate.

A fishing spot should define:
- cast anchor
- water target
- fish pool
- bite state
- tension/reel state if supported
- catch result
- reward
- feedback

---

# BOWLING

Bowling ball and pins remain separate objects with actual gameplay state.

Required location features:

- exterior
- lobby
- shoe counter
- lane selection
- lanes
- ball return
- pins
- seating
- scoreboard
- arcade/lounge if supported

Physics should align with visible lane geometry.

---

# RACING

Use explicit routes/checkpoints.

Required:

- car meet
- start line
- checkpoint route
- finish
- garage/mod area if appropriate
- spectator zone
- parking anchors
- night lighting

Do not create a race from arbitrary world coordinates.

Race vehicles must follow the actual route tangent.

---

# FOOD TRUCK ZONE

Required:

- truck anchor positions
- ordering points
- vendor anchors
- menu boards
- seating
- tables
- food props
- customer queue zones
- event/night lighting

NPC queues should not block traversal.

---

# SPORTS/INTERACTIVE PROPS

Use the Gameplay Props & Items Production Pack.

Never bake equipment into character art.

Gameplay objects need stable IDs and state.

Examples:

`prop.sports.basketball`
`prop.sports.hoop`
`prop.fishing.rod`
`prop.fishing.bobber`
`prop.bowling.ball`
`prop.bowling.pin`
`pickup.cash`
`pickup.key`
`pickup.package`
`pickup.collectible`

Props should define where relevant:

- world scale
- collider
- interaction radius
- pickup state
- persistence
- physics state

Recommended:

`window.__SACK_PROP_DEBUG__`

---

# NPC / PEDESTRIAN SYSTEM

The world must not feel empty.

A prior major problem was that players could not see pedestrians/NPCs.

Build a proper population system with:

- spawn zones
- wander routes
- idle anchors
- shop customer anchors
- seating anchors
- court spectator anchors
- race spectator anchors
- food-truck queue anchors
- distance-based updates
- sensible despawn logic

Avoid white-box placeholders, blank cards, or mannequin-looking humans in the final experience.

Named NPCs include:

- K Blanco
- Court OG
- Mama Dee
- Unc J
- Nitro
- Strike

Named NPCs should not be treated as generic pedestrian instances.

Do not spawn huge numbers of expensive full-detail NPCs.

Use density/LOD/update throttling.

---

# WARDROBE

Preserve the existing wardrobe system if viable.

Known outfit families include:

- starter_green
- black_gold
- cream_green
- deep_gold
- 901 jerseys
- basketball jerseys
- Halloween outfits

Rules:

- equipped outfit saves correctly
- owned outfits persist
- pre-dressed action images bypass generic compositing
- missing outfit-specific actions safely fall back
- no double clothing overlays

---

# ECONOMY + PROGRESSION

Support:

- SackDollars
- Respect
- outfit ownership
- purchases
- activity rewards
- mission rewards
- unlocks
- location discovery

Keep game state centralized.

Do not store authoritative economy state only inside UI components.

---

# MISSIONS

Strengthen the Drop Day structure.

Mission system needs stable:

- mission IDs
- objective IDs
- active state
- completed state
- rewards
- interaction requirements
- location anchors
- save persistence

Gameplay can include:

- dialogue
- deliveries
- shopping
- outfit ownership
- basketball
- driving
- local activities
- money
- Respect
- location discovery

Do not complete missions only because the player crossed an arbitrary invisible coordinate.

Require meaningful interactions.

---

# UI / HUD

Use the UI/HUD Production Pack.

Core visual language:

- near-black / charcoal
- gold
- controlled green
- activity-specific accent colors
- readable typography
- strong SackReligious identity without excessive decoration

Required systems:

- gameplay HUD
- minimap
- full map / fast travel
- phone
- mission tracker
- dialogue
- inventory
- wardrobe
- shop
- vehicle UI
- basketball HUD
- fishing HUD
- bowling HUD
- racing HUD
- pause menu
- notifications
- interaction prompts
- money/Respect display
- location introductions

Keep the center gameplay area clear.

Mission UI should collapse/expand.

Do not display duplicate keyboard/gamepad/touch prompts simultaneously.

Recommended:

`window.__SACK_UI_DEBUG__`

---

# INPUT ABSTRACTION

Use one logical action layer.

Examples:

- move_up
- move_down
- move_left
- move_right
- interact
- primary_action
- secondary_action
- sprint
- phone
- map
- inventory
- pause
- confirm
- cancel
- next_tab
- previous_tab

Keyboard, controller, and mobile should map into the same actions.

Do not fork core gameplay logic by input device.

---

# MOBILE

Mobile is a first-class target.

Requirements:

- responsive canvas/layout
- safe-area awareness
- large thumb targets
- left-thumb movement
- right-side contextual controls
- context-sensitive buttons
- readable text
- fewer simultaneous HUD elements than desktop
- performant rendering
- no tiny desktop UI simply scaled down

Test at minimum:

- 390x844
- one wider modern mobile viewport

---

# SEASONAL CONTENT

901 Day and Halloween should be reversible layers over the normal game.

Seasonal overrides may change:

- lighting
- decorations
- props
- signage
- weather
- NPC clothing
- missions
- court treatment
- VFX
- audio hooks

Base geometry and collision should remain stable where possible.

---

# HAUNTED HOUSE

Preserve good existing haunted-house work if present.

The intended structure is a physical 2.5D adventure, not static slides.

Use:

- real doorway transitions
- room state
- puzzles
- backtracking
- persistent solved state
- foreground occlusion
- environmental animation
- physical exits
- room lighting

Do not reintroduce:
- floating EXIT buttons
- random coordinate teleports
- dialogue-end teleports
- static slideshow behavior

If the existing `feat/halloween-after-dark` implementation is good, integrate rather than unnecessarily rewriting it.

---

# ASSET ARCHITECTURE

Create or improve a centralized asset registry.

Avoid random string paths scattered across the codebase.

Recommended namespaces:

- character.*
- outfit.*
- vehicle.*
- building.*
- location.*
- prop.*
- pickup.*
- ui.*
- fx.*
- seasonal.*

Missing optional assets should fail gracefully.

One missing image must not crash an entire scene.

Use optimized runtime derivatives instead of shipping enormous reference-board textures directly.

---

# SIGNAGE / TEXT

AI concept art may contain inaccurate or gibberish wording.

Do not ship gibberish text.

Use:

- real logo assets
- HTML/CSS/canvas text
- clean authored textures
- modular sign surfaces

for readable branding and signage.

---

# SAVE / LOAD

Persist at minimum:

- player location
- safe spawn
- money
- Respect
- inventory
- owned outfits
- equipped outfit
- mission progress
- completed missions
- discovered locations
- relevant activity state
- seasonal state when appropriate
- persistent haunted-house puzzle state when appropriate

Do not save the player inside invalid collision geometry.

---

# PERFORMANCE

Reference images are design material, not necessarily runtime assets.

Optimize:

- texture resolution
- preloading
- instancing
- repeated props
- NPC update frequency
- traffic update frequency
- distance culling
- LOD where useful
- dynamic-light count
- scene transitions
- asset reuse

The goal is good visual presentation without making mobile unusable.

---

# DEBUG SYSTEM

Create a unified debug mode.

Recommended globals:

- `window.__SACK_DEBUG__`
- `window.__SACK_TRAFFIC_DEBUG__`
- `window.__SACK_LOCATION_DEBUG__`
- `window.__SACK_PROP_DEBUG__`
- `window.__SACK_UI_DEBUG__`

Debug may show:

- FPS
- player position
- player collider
- current facing
- NPC count
- vehicle count
- traffic routes
- location ID
- walkable/collision bounds
- interaction anchors
- spawn anchors
- current outfit
- active mission
- current activity
- active input mode
- loaded/missing assets

Normal players should not see debug overlays.

---

# DEVELOPMENT PROCESS

Work incrementally.

Do not make one giant unreviewable commit.

Suggested commit sequence:

1. production audit
2. production plan
3. world scale + asset registry
4. input abstraction
5. collision/debug foundation
6. player/camera polish
7. road/lane graph
8. traffic repair
9. NPC population system
10. location framework
11. HQ vertical slice
12. K Blanco / delivery mission
13. 901 Court integration
14. activity locations
15. economy/mission/wardrobe
16. UI/HUD
17. mobile
18. seasonal integration
19. optimization
20. QA fixes

Do not merge the production branch without review.

---

# FIRST VERTICAL SLICE

Do not rebuild every location simultaneously.

The first production-quality vertical slice should be:

**Benji Home → Neighborhood Streets → Real Traffic → SackReligious HQ → K Blanco Interaction → Delivery Mission → 901 Basketball Court**

This slice must prove:

- player movement
- correct direction/facing
- collision
- camera
- roads
- traffic
- NPC visibility
- building entry/exit
- HQ interior
- K Blanco dialogue
- mission state
- package interaction
- economy/reward hooks
- court transition
- basketball gameplay
- desktop controls
- mobile controls
- save/reload

Once this vertical slice is strong, apply the same architecture to:

- fishing
- bowling
- racing
- food trucks
- downtown
- neighborhood expansion
- haunted house
- seasonal events

---

# MANDATORY QA

Manually test before calling a phase complete.

Player:
- W/A/S/D
- sprint
- stop/start
- collision
- camera
- interaction

Confirm facing:
- A = left
- D = right
- W = back
- S = front

NPC:
- regular pedestrian visible
- K Blanco visible
- Court OG visible
- proximity
- dialogue
- collision/overlap handling

Traffic:
- follow multiple cars
- straight roads
- curves
- intersections
- turns
- stop behavior
- parking
- spawn/despawn
- no sideways cars
- no building penetration
- no sidewalk wandering unless intentionally parking

Basketball:
- enter court
- ball resets
- tap shoot
- hold/release
- maximum charge
- rebound
- reset
- leave/re-enter

Buildings:
- enter through physical entrance
- walk inside
- collide with walls
- interact
- exit
- return to correct exterior anchor
- save/reload

Mobile:
- 390x844
- movement
- interaction
- activity controls
- map
- shop
- wardrobe
- safe-area layout

Save:
- location
- safe spawn
- outfit
- money
- Respect
- mission progress
- discovery state

---

# AUTOMATED VALIDATION

Use the actual project scripts, but where supported run at minimum:

`npm ci` or `npm install`
`npm run build`
`npm run lint`
`npx tsc --noEmit`

Do not report success while relevant build/type/lint failures remain.

---

# VISUAL QA

Capture screenshots or equivalent evidence of:

- neighborhood traversal
- downtown/street environment
- HQ exterior
- HQ interior
- K Blanco interaction
- traffic
- traffic debug
- basketball court
- riverfront/fishing
- bowling
- racing
- daytime
- nighttime
- mobile HUD

Compare results with the production-reference packs.

---

# DO NOT

Do not:

- merge into main automatically
- rewrite working systems without analysis
- redesign Benji
- redesign canonical K Blanco
- make K Blanco male
- bake basketball into Benji
- bake fishing equipment into Benji
- bake bowling equipment into Benji
- render full raw sprite sheets
- use black rectangle sprite backgrounds
- reverse directional sprites
- allow cars to drive sideways
- allow cars through buildings
- use random teleports for world traversal
- make major interiors static non-playable pictures
- turn haunted house into a slideshow
- use giant permanent HUD overlays
- ship gibberish signage
- create separate contradictory mobile gameplay
- call QA complete without running/testing the game

---

# FIRST CHECKPOINT RESPONSE

Your first substantial checkpoint should report:

1. repository and branch used
2. current base commit
3. audit summary
4. systems worth preserving
5. systems requiring repair
6. production packs successfully inspected
7. architecture plan
8. first vertical-slice plan
9. files/modules you intend to modify first
10. risks/blockers
11. build/lint/typecheck baseline
12. exact local preview/run instructions

Then begin implementation.

Do not stop at analysis unless a true blocker prevents coding.

The success standard is not merely “the app runs.”

The success standard is that the world makes physical sense, Benji moves correctly, people are visible, vehicles follow actual roads, buildings have collision and playable interiors, activities work, missions persist, UI feels intentional, mobile is usable, seasonal content layers cleanly, and the result feels like one coherent game rather than disconnected prototypes.

Begin with the audit now.
