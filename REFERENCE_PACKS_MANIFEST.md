# Reference Packs Manifest

Canonical private source repository:

`Tre2k3/SackReligious-Game/reference-packs/`

Copy these exact eight ZIPs into this repository at:

`reference-packs/`

| File | Git blob SHA | Size (bytes) |
|---|---|---:|
| SackReligious_Activity_Locations_Production_Pack_v1.zip | eed94815ddfdff2c497e78230680a809573d446e | 34476802 |
| SackReligious_Character_Bible_AI_Reference_Pack.zip | 898be221a3e68f743eaa5368c690a341cfd0d01c | 33296971 |
| SackReligious_Console_Quality_Game_Concepts.zip | 62be358a8196fc190d9e5e4943b9bf0c42cb2c8b | 16616650 |
| SackReligious_Gameplay_Props_Items_Production_Pack_v1.zip | 5f7c91e4c2f67e392427c7146708d5f4acd825d4 | 17070012 |
| SackReligious_HQ_Production_Reference_Pack_v1.zip | fad72d413d085370d685faf6e0c63a1cee865c95 | 41220864 |
| SackReligious_UI_HUD_Production_Pack_v1.zip | 9e1f5b412e37f44fca6af3182492cbdd01d88d4c | 32997711 |
| SackReligious_Vehicle_Street_Systems_Production_Pack_v1.zip | 2b398534e0076d4924f1245bc41a2ba3fd3cc11c | 29668906 |
| SackReligious_World_Buildings_Reference_Pack_v1.zip | b30b1dc2629c9617ea62d026e8bb6e6aa171d525 | 63984880 |

## Required verification

After copying:

```bash
for f in reference-packs/*.zip; do unzip -t "$f" >/dev/null || exit 1; done
git status --short
```

Do not proceed with production work until all eight are present and readable.
