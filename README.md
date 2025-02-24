## Branch Updates

Potential Updates -> https://github.com/JAG-GW


## GWA2 Version Updated

Fully working GWA2 as off 28.12.24
Please report any errors you find.






### Quick-explanation of the comments:
- **UPDATED**: The pattern has been successfully updated. The pattern was found in the old client and found in the new client using similar instructions from the new compiler.
- **STILL WORKING**: The pattern has not changed at all. It worked with the newest update.
- **COULD NOT UPDATE!**: The pattern could not be updated at all because there has not been any old result in the old client.

## Updated Patterns
The following patterns were successfully updated as of December 23, 2024:

1. **ScanAgentBase:**
   - Pattern: `FF501083C6043BF775E2`
   - Updated: 23.12.24

2. **ScanAgentBasePointer:**
   - Pattern: `FF501083C6043BF775E2`
   - Updated: 23.12.24

3. **ScanCurrentTarget:**
   - Pattern: `83C4085F8BE55DC3CCCCCCCCCCCCCCCCCCCCCC55`
   - Updated: 23.12.24

4. **ScanEngine:**
   - Pattern: `56FFD083C4048BCEE897`
   - Updated: 23.12.24, needs to be updated each patch
   - Changes to: $lTemp = GetScannedAddress('ScanEngine', -0x6D + 2) ;-16  ; Previous ('ScanEngine', -0x6E) ;-16   - Updated 24.12.24

5. **ScanPing:**
   - Pattern: `E874651600`
   - Updated: 23.12.24

6. **ScanLoggedIn:**
   - Pattern: `BEFFC705C0`
   - Updated: 24.12.24, Old: `BFFFC70580 85C07411B807`

7. **ScanPacketSendFunction:**
   - Pattern: `F7D81BC02500800000`
   - Updated: 24.12.24, Old: `F7D9C74754010000001BC981, 558BEC83EC2C5356578BF985`

8. **ScanActionBase:**
   - Pattern: `8D1C87899DF4`
   - Updated: 24.12.24, Old: `8D1C87899DF4FEFFFF8BC32BC7C1F802, 8B4208A80175418B4A08`

9. **ScanSleep:**
   - Pattern: `6A0057FF15D8408A006860EA0000`
   - Updated: 24.12.24, Old: `5F5E5B741A6860EA0000`

10. **ScanSalvageFunction:**
    - Pattern: `33C58945FC8B45088945F08B450C8945F48B45108945F88D45EC506A10C745EC76`
    - Updated: 24.12.24, Old: `33C58945FC8B45088945F08B450C8945F48B45108945F88D45EC506A10C745EC75`

11. **ScanForCharname:**
    - Description: The `ScanForCharname` function has been updated to use `$lCharNameCode` and a `readprocessmemory` call at `$lTmpAddress + 6`.

## No Updates
The following patterns could not be updated as of December 23, 2024:

1. **ScanLoadFinished:**
   - Pattern: `8B561C8BCF52E8`

2. **ScanPostMessage:**
   - Pattern: `6A00680080000051FF15`

3. **ScanTargetLog:**
   - Pattern: `5356578BFA894DF4E8`

4. **ScanMapLoading:** UPDATED 25.12.24, 6A2C50E8 
   - Pattern: `549EB20000000000`
   - Comment: `6A2C50E8`
_('ScanMapLoading:')
AddPattern('2480ED0000000000') ; UPDATED 25.12.24, 6A2C50E8

5. **ScanLanguage:**
   - Pattern: `C38B75FC8B04B5`

6. **ScanSkillLog:**
   - Pattern: `408946105E5B5D`

7. **ScanSkillCompleteLog:**
   - Pattern: `741D6A006A40`

8. **ScanSkillCancelLog:**
   - Pattern: `741D6A006A48`

9. **ScanChatLog:**
   - Pattern: `8B45F48B138B4DEC50`

10. **ScanSellItemFunction:**
    - Pattern: `8B4D2085C90F858E`

11. **ScanStringLog:**
    - Pattern: `893E8B7D10895E04397E08`

12. **ScanStringFilter1:**
    - Pattern: `8B368B4F2C6A006A008B06`

13. **ScanStringFilter2:**
    - Pattern: `515356578BF933D28B4F2C`

14. **ScanTraderHook:**
    - Pattern: `8955FC6A008D55F8B9BB`

15. **ScanZoomStill:**
    - Pattern: `558BEC8B41085685C0`

16. **ScanZoomMoving:**
    - Pattern: `EB358B4304`

17. **ScanBuildNumber:**
    - Pattern: `558BEC83EC4053568BD9`

18. **ScanCharslots:**
    - Pattern: `8B551041897E38897E3C897E34897E48897E4C890D`

19. **ScanReadChatFunction:**
    - Pattern: `A128B6EB00`

## Contribution

Contributions to this repository are welcome. If you have additional headers or improvements, please feel free to submit a pull request or open an issue.

## License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.
