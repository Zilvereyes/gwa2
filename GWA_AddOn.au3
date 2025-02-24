#include-once
#include <Array.au3>

;GENERAL THNX to miracle444 for his work with GWA2

;=================================================================================================
; Function:

; Description:		Globals from GWCA still working in GWA2
; Parameter(s):
;
; Requirement(s):
; Return Value(s):
; Author(s):		GWCA team
;=================================================================================================
#Region Global Items
Global Const $RARITY_Gold = 2624
Global Const $RARITY_Purple = 2626
Global Const $RARITY_Blue = 2623
Global Const $RARITY_White = 2621
Global Const $PickUpAll = False

Global $Armor_of_Salvation_item_effect = 2520
Global $Grail_of_Might_item_effect = 2521
Global $Essence_of_Celerity_item_effect = 2522

Global Enum $HERO_Norgu = 1, $HERO_Goren, $HERO_Tahlkora, $HERO_MasterOfWhispers, $HERO_AcolyteJin, $HERO_Koss, $HERO_Dunkoro, $HERO_AcolyteSousuke, $HERO_Melonni, _
$HERO_ZhedShadowhoof, $HERO_GeneralMorgahn, $HERO_MargridTheSly, $HERO_Olias = 14, $HERO_Razah, $HERO_MOX, $HERO_Jora = 18, $HERO_PyreFierceshot, _
$HERO_Livia = 21, $HERO_Hayda, $HERO_Kahmu, $HERO_Gwen, $HERO_Xandra, $HERO_Vekk, $HERO_Ogden
Global Enum $HERO_MercenaryHero1 = 28, $HERO_MercenaryHero2 = 29, $HERO_MercenaryHero3 = 30, $HERO_MercenaryHero4 = 31, $HERO_MercenaryHero5 = 32, $HERO_MercenaryHero6 = 33, $HERO_MercenaryHero7 = 34, $HERO_MercenaryHero8 = 35
Global Enum $HEROMODE_Fight, $HEROMODE_Guard, $HEROMODE_Avoid


;~ Materials
Global Const $model_id_lockpick = 22751
Global Const $model_id_glacial_stone = 27047
Global Const $model_id_bone = 921
Global Const $model_id_iron_ingot = 948
Global Const $model_id_wood_plank = 946
Global Const $model_id_granite_slab = 955
Global Const $model_id_dust = 929
Global Const $model_id_scale = 953
Global Const $model_id_tanned_hide_square = 940
Global Const $model_id_bolt_of_cloth = 925
Global Const $model_id_Saurian_bone = 27035
Global Const $model_id_brood_claws = 27982
Global Const $model_id_sin_tome = 21796
Global $All_Materials_Array[36] = [921, 922, 923, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 948, 949, 950, 951, 952, 953, 954, 955, 956, 6532, 6533]
Global $Common_Materials_Array[11] = [921, 925, 929, 933, 934, 940, 946, 948, 953, 954, 955]
Global $Rare_Materials_Array[25] = [922, 923, 926, 927, 928, 930, 931, 932, 935, 936, 937, 938, 939, 941, 942, 943, 944, 945, 949, 950, 951, 952, 956, 6532, 6533]

;~ General Items
Global $General_Items_Array[6] = [2989, 2991, 2992, 5899, 5900, 22751]
Global Const $item_type_axe = 2
Global Const $item_type_bow = 5
Global Const $item_type_offhand = 12
Global Const $item_type_hammer = 15
Global Const $item_type_wand = 22
Global Const $item_type_shield = 24
Global Const $item_type_staff = 26
Global Const $item_type_sword = 27
Global Const $item_type_dagger = 32
Global Const $item_type_scythe = 35
Global Const $item_type_spear = 36

; Define global constants  
Global Const $STATIC_AGENT_TYPE = 0x200  
Global Const $ITEM_AGENT_TYPE = 0x400  
Global Const $CHEST_TYPE = 512  
  
; Initialize chest tracking array  
Global $OpenedChestAgentIDs = [] 



Global $OpenedChestAgentIDs[1]
Global $aChestID[9000]
     $aChestID[65] = "Krytan Chest"
     $aChestID[66] = "Elonian Chest"
     $aChestID[67] = "Maguuma Chest"
     $aChestID[68] = "Phantom Chest"
     $aChestID[69] = "Ascalonian Chest"
	 $aChestID[70] = "Miners Chest"
     $aChestID[71] = "Steel Chest"
     $aChestID[72] = "Shiverpeak Chest"
     $aChestID[73] = "Darkstone Chest"
	 $aChestID[74] = "Obsidian Chest"
	 $aChestID[4576] = "Forbidden Chest"
     $aChestID[4577] = "Kurzick Chest"
	 $aChestID[4578] = "Stoneroot Chest"
     $aChestID[4579] = "Shing Jea Chest"
	 $aChestID[4580] = "Luxon Chest"
	 $aChestID[4581] = "Deep Jade Chest"
     $aChestID[4582] = "Canthan Chest"
	 $aChestID[6061] = "Ancient Elonian Chest"
     $aChestID[6062] = "Istani Chest"
	 $aChestID[6063] = "Vabbi Chest"
     $aChestID[6064] = "Kournan Chest"
     $aChestID[6065] = "Margonite Chest"
     $aChestID[7053] = "Demonic Chest"
	 $aChestID[8141] = "Locked Chest"

;~ Dungeon Key
Global Const $TYPE_KEY = 18

;Kits
;Global Const $MODEL_ID_CHEAP_SALVAGE_KIT	= 2992
;Global Const $MODEL_ID_SALVAGE_KIT			= 5900
;Global Const $MODEL_ID_CHEAP_ID_KIT			= 2989
Global Const $MODEL_ID_EXPERT_SALVAGE_KIT = 2991
Global Const $MODEL_ID_ID_KIT				= 5899
;Global Const $EXPERT_SALVAGE_KIT_MODEL_ID = 2991
Global Const $EXPERT_SALVAGE_KIT_USES_DIVISOR = 8
Global Const $BASIC_SALVAGE_KIT_MODEL_ID = 2992
Global Const $SUPERIOR_SALVAGE_KIT_MODEL_ID = 5900
Global Const $SUPERIOR_SALVAGE_KIT_USES_DIVISOR = 10


;~ Charr Carving
Global Const $Carving = 27052 

;~ All Weapon mods
Global $Weapon_Mod_Array[25] = [893, 894, 895, 896, 897, 905, 906, 907, 908, 909, 6323, 6331, 15540, 15541, 15542, 15543, 15544, 15551, 15552, 15553, 15554, 15555, 17059, 19122, 19123]

;~ General Items
Global $General_Items_Array[6] = [2989, 2991, 2992, 5899, 5900, 22751]
Global Const $ITEM_ID_Lockpicks = 22751

;~ Dyes
Global Const $ITEM_ID_Dyes = 146
Global Const $ITEM_ExtraID_BlackDye = 10
Global Const $ITEM_ExtraID_WhiteDye = 12

;~ Alcohol
Global $Alcohol_Array[19] = [910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 19172, 19173, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682]
Global $OnePoint_Alcohol_Array[11] = [910, 5585, 6049, 6367, 6375, 15477, 19171, 19172, 19173, 22190, 28435]
Global $ThreePoint_Alcohol_Array[7] = [2513, 6366, 24593, 30855, 31145, 31146, 35124]
Global $FiftyPoint_Alcohol_Array[1] = [36682]

;~ Party
Global $Spam_Party_Array[5] = [6376, 21809, 21810, 21813, 36683]

;~ Sweets
Global $Spam_Sweet_Array[6] = [21492, 21812, 22269, 22644, 22752, 28436]

;~ Tonics
Global $Tonic_Party_Array[4] = [15837, 21490, 30648, 31020]

;~ DR Removal
Global $DPRemoval_Sweets[6] = [6370, 21488, 21489, 22191, 26784, 28433]

;~ Special Drops
Global $Special_Drops[7] = [5656, 18345, 21491, 37765, 21833, 28433, 28434]

;~ Stupid Drops that I am not using, but in here in case you want these to add these to the CanPickUp and collect in your chest
Global $Map_Piece_Array[4] = [24629, 24630, 24631, 24632]

;~ Stackable Trophies
Global $Stackable_Trophies_Array[1] = [27047]
Global Const $ITEM_ID_Glacial_Stones = 27047


;~ Tomes
Global $All_Tomes_Array[20] = [21796, 21797, 21798, 21799, 21800, 21801, 21802, 21803, 21804, 21805, 21786, 21787, 21788, 21789, 21790, 21791, 21792, 21793, 21794, 21795]
Global Const $ITEM_ID_Mesmer_Tome = 21797

;~ Arrays for the title spamming (Not inside this version of the bot, but at least the arrays are made for you)
Global $ModelsAlcohol[100] = [910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682]
Global $ModelSweetOutpost[100] = [15528, 15479, 19170, 21492, 21812, 22644, 31150, 35125, 36681]
Global $ModelsSweetPve[100] = [22269, 22644, 28431, 28432, 28436]
Global $ModelsParty[100] = [6368, 6369, 6376, 21809, 21810, 21813]

Global $Array_pscon[39]=[910, 5585, 6366, 6375, 22190, 24593, 28435, 30855, 31145, 35124, 36682, 6376, 21809, 21810, 21813, 36683, 21492, 21812, 22269, 22644, 22752, 28436,15837, 21490, 30648, 31020, 6370, 21488, 21489, 22191, 26784, 28433, 5656, 18345, 21491, 37765, 21833, 28433, 28434]


Global $Legion = False, $Bool_IdAndSell = False, $Bool_HM = False, $Bool_Store = False, $Bool_PickUp = False, $Bool_usealc = False, $Bool_cons = False, $Bool_Donate = False, $Bool_Uselockpicks = False

#Region Global MatsPic´s And ModelID´Select
Global $PIC_MATS[26][2] = [["Fur Square", 941],["Bolt of Linen", 926],["Bolt of Damask", 927],["Bolt of Silk", 928],["Glob of Ectoplasm", 930],["Steel of Ignot", 949],["Deldrimor Steel Ingot", 950],["Monstrous Claws", 923],["Monstrous Eye", 931],["Monstrous Fangs", 932],["Rubies", 937],["Sapphires", 938],["Diamonds", 935],["Onyx Gemstones", 936],["Lumps of Charcoal", 922],["Obsidian Shard", 945],["Tempered Glass Vial", 939],["Leather Squares", 942],["Elonian Leather Square", 943],["Vial of Ink", 944],["Rolls of Parchment", 951],["Rolls of Vellum", 952],["Spiritwood Planks", 956],["Amber Chunk", 6532],["Jadeite Shard", 6533]]
#EndRegion Global MatsPic´s And ModelID´Select

;Global $Array_Store_ModelIDs460[147] = [474, 476, 486, 522, 525, 811, 819, 822, 835, 610, 2994, 19185, 22751, 4629, 24630, 4631, 24632, 27033, 27035, 27044, 27046, 27047, 7052, 5123 _
;		, 1796, 21797, 21798, 21799, 21800, 21801, 21802, 21803, 21804, 1805, 910, 2513, 5585, 6049, 6366, 6367, 6375, 15477, 19171, 22190, 24593, 28435, 30855, 31145, 31146, 35124, 36682 _
;		, 6376 , 6368 , 6369 , 21809 , 21810, 21813, 29436, 29543, 36683, 4730, 15837, 21490, 22192, 30626, 30630, 30638, 30642, 30646, 30648, 31020, 31141, 31142, 31144, 1172, 15528 _
;		, 15479, 19170, 21492, 21812, 22269, 22644, 22752, 28431, 28432, 28436, 1150, 35125, 36681, 3256, 3746, 5594, 5595, 5611, 5853, 5975, 5976, 21233, 22279, 22280, 6370, 21488 _
;		, 21489, 22191, 35127, 26784, 28433, 18345, 21491, 28434, 35121, 921, 922, 923, 925, 926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936, 937, 938, 939, 940, 941, 942, 943 _
;		, 944, 945, 946, 948, 949, 950, 951, 952, 953, 954, 955, 956, 6532, 6533]

#EndRegion Global Items

Global Enum $BAG_Backpack = 1, $BAG_BeltPouch, $BAG_Bag1, $BAG_Bag2, $BAG_EquipmentPack, $BAG_UnclaimedItems = 7, $BAG_Storage1, $BAG_Storage2, _
		$BAG_Storage3, $BAG_Storage4, $BAG_StorageAnniversary, $BAG_Storage5, $BAG_Storage6, $BAG_Storage7, $BAG_Storage8



Global Enum $ATTRIB_FastCasting, $ATTRIB_IllusionMagic, $ATTRIB_DominationMagic, $ATTRIB_InspirationMagic, _
		$ATTRIB_BloodMagic, $ATTRIB_DeathMagic, $ATTRIB_SoulReaping, $ATTRIB_Curses, _
		$ATTRIB_AirMagic, $ATTRIB_EarthMagic, $ATTRIB_FireMagic, $ATTRIB_WaterMagic, $ATTRIB_EnergyStorage, _
		$ATTRIB_HealingPrayers, $ATTRIB_SmitingPrayers, $ATTRIB_ProtectionPrayers, $ATTRIB_DivineFavor, _
		$ATTRIB_Strength, $ATTRIB_AxeMastery, $ATTRIB_HammerMastery, $ATTRIB_Swordsmanship, $ATTRIB_Tactics, _
		$ATTRIB_BeastMastery, $ATTRIB_Expertise, $ATTRIB_WildernessSurvival, $ATTRIB_Marksmanship, _
		$ATTRIB_DaggerMastery, $ATTRIB_DeadlyArts, $ATTRIB_ShadowArts, _
		$ATTRIB_Communing, $ATTRIB_RestorationMagic, $ATTRIB_ChannelingMagic, _
		$ATTRIB_CriticalStrikes, _
		$ATTRIB_SpawningPower, _
		$ATTRIB_SpearMastery, $ATTRIB_Command, $ATTRIB_Motivation, $ATTRIB_Leadership, _
		$ATTRIB_ScytheMastery, $ATTRIB_WindPrayers, $ATTRIB_EarthPrayers, $ATTRIB_Mysticism

Global Enum $EQUIP_Weapon, $EQUIP_Offhand, $EQUIP_Chest, $EQUIP_Legs, $EQUIP_Head, $EQUIP_Feet, $EQUIP_Hands

Global Enum $SKILLTYPE_Stance = 3, $SKILLTYPE_Hex, $SKILLTYPE_Spell, $SKILLTYPE_Enchantment, $SKILLTYPE_Signet, $SKILLTYPE_Well = 9, _
		$SKILLTYPE_Skill, $SKILLTYPE_Ward, $SKILLTYPE_Glyph, $SKILLTYPE_Attack = 14, $SKILLTYPE_Shout, $SKILLTYPE_Preparation = 19, _
		$SKILLTYPE_Trap = 21, $SKILLTYPE_Ritual, $SKILLTYPE_ItemSpell = 24, $SKILLTYPE_WeaponSpell, $SKILLTYPE_Chant = 27, $SKILLTYPE_EchoRefrain

Global Enum $REGION_International = -2, $REGION_America = 0, $REGION_Korea, $REGION_Europe, $REGION_China, $REGION_Japan

Global Enum $LANGUAGE_English = 0, $LANGUAGE_French = 2, $LANGUAGE_German, $LANGUAGE_Italian, $LANGUAGE_Spanish, $LANGUAGE_Polish = 9, $LANGUAGE_Russian

Global Const $FLAG_RESET = 0x7F800000; unflagging heores

Global $DroknardIsHere = 0


Global $intSkillEnergy[8] = [1, 15, 5, 5, 10, 15, 10, 5]
; Change the next lines to your skill casting times in milliseconds. use ~250 for shouts/stances, ~1000 for attack skills:
Global $intSkillCastTime[8] = [1000, 1250, 1250, 1250, 1250, 1000,  250, 1000]
; Change the next lines to your skill adrenaline count (1 to 8). leave as 0 for skills without adren
Global $intSkillAdrenaline[8] = [0, 0, 0, 0, 0, 0, 0, 0]

Global $totalskills = 7

Global $iItems_Picked = 0

Global $DeadOnTheRun = 0

; Define a custom structure via a DLL call for item properties
Global $lItemExtraStruct = DllStructCreate("byte rarity;" & _
                                           "byte unknown1[3];" & _
                                           "byte modifier;" & _
                                           "byte unknown2[13];" & _
                                           "byte lastModifier")

; Define rune array
Local $aRunes[39][2] = [ _
    [0x240801F9, "Rune.KnightsInsignia"], [0x24080208, "Rune.LieutenantsInsignia"], [0x24080209, "Rune.StonefistInsignia"], _
    [0x240801FA, "Rune.DreadnoughtInsignia"], [0x240801FB, "Rune.SentinelsInsignia"], [0x240800FC, "Rune.RuneOfMinorAbsorption"], _
    [0x21E81501, "Rune.RuneOfMinorTactics"], [0x21E81101, "Rune.RuneOfMinorStrength"], [0x21E81201, "Rune.RuneOfMinorAxeMastery"], _
    [0x21E81301, "Rune.RuneOfMinorHammerMastery"], [0x21E81401, "Rune.RuneOfMinorSwordsmanship"], [0x240800FD, "Rune.RuneOfMajorAbsorption"], _
    [0x21E81502, "Rune.RuneOfMajorTactics"], [0x21E81102, "Rune.RuneOfMajorStrength"], [0x21E81202, "Rune.RuneOfMajorAxeMastery"], _
    [0x21E81302, "Rune.RuneOfMajorHammerMastery"], [0x21E81402, "Rune.RuneOfMajorSwordsmanship"], [0x240800FE, "Rune.RuneOfSuperiorAbsorption"], _
    [0x21E81503, "Rune.RuneOfSuperiorTactics"], [0x21E81103, "Rune.RuneOfSuperiorStrength"], [0x21E81203, "Rune.RuneOfSuperiorAxeMastery"], _
    [0x21E81303, "Rune.RuneOfSuperiorHammerMastery"], [0x21E81403, "Rune.RuneOfSuperiorSwordsmanship"], [0x240801FC, "Rune.FrostboundInsignia"], _
    [0x240801FE, "Rune.PyreboundInsignia"], [0x240801FF, "Rune.StormboundInsignia"], [0x24080201, "Rune.ScoutsInsignia"], _
    [0x240801FD, "Rune.EarthboundInsignia"], [0x24080200, "Rune.BeastmastersInsignia"], [0x21E81801, "Rune.RuneOfMinorWildernessSurvival"], _
    [0x24080211, "Rune.RuneOfAttunement"], [0x24080213, "Rune.RuneOfRecovery"], [0x24080214, "Rune.RuneOfRestoration"], _
    [0x24080215, "Rune.RuneOfClarity"], [0x24080216, "Rune.RuneOfPurity"], [0x240800FF, "Rune.RuneOfMinorVigor"], _
    [0x24080101, "Rune.RuneOfSuperiorVigor"], [0x24080100, "Rune.RuneOfMajorVigor"], [0x24080212, "Rune.RuneOfVitae"] _
]

; Function to find rune by modifier
Func FindRuneByModifier($modifier)
    For $i = 0 To UBound($aRunes) - 1
        If Hex($modifier, 8) == $aRunes[$i][0] Then
            Return $aRunes[$i][1]
        EndIf
    Next
    Return "Unknown Modifier"
EndFunc

; Example usage
; 	DllStructSetData($lItemExtraStruct, "modifier", 0x240801F9)  ; set an example modifier
; 	Local $runeName = FindRuneByModifier(DllStructGetData($lItemExtraStruct, "modifier"))
; 	ConsoleWrite("Rune associated with the modifier: " & $runeName & @CRLF)
;This script helps associate modifiers in an item's data structure with a readable string name from the rune array, facilitating easier processing and display. 
;
;======TEST TEST TEST END
;======================		
;===========================================================================
		
		
Global $lItemExtraStructPtr = DllStructGetPtr($lItemExtraStruct)
Global $lItemExtraStructSize = DllStructGetSize($lItemExtraStruct)
#comments-start
Global $lItemNameStruct = DllStructCreate("byte rarity;"& _; Colour of the item (can be used as rarity); follow $lItemExtraStruct ->same pointer
		"byte ModMode;" & _;
		"byte ModCount;" & _;Number of Mods in the item
		"byte Name[4];" & _;Name ID of the item
		"byte Prefix[4];" & _; Depending on Item, Insignia, Axe Haft, Sword Hilt etc.
		"byte Suffix1[4];" & _; Depending on Item, Rune, Axe Grip, Sword Pommel etc.
		"byte Suffix2[4]"); (Runes Only) Quality of the Suffix (e.g. superior)

Global $lItemNameStructPtr = DllStructGetPtr($lItemNameStruct)
Global $lItemNameStructSize = DllStructGetSize($lItemNameStruct)
#comments-end

;-------> Item Extra Req Struct Definition
Global $lItemExtraReqStruct = DllStructCreate( _
		"byte requirement;" & _
		"byte attribute");Skill Template Format
Global $lItemExtraReqStructPtr = DllStructGetPtr($lItemExtraReqStruct)
Global $lItemExtraReqStructSize = DllStructGetSize($lItemExtraReqStruct)
;-------> Item Mod Struct definition
Global $lItemModStruct = DllStructCreate( _
		"byte unknown1[28];" & _
		"byte armor")
Global $lItemModStructPtr = DllStructGetPtr($lItemModStruct)
Global $lItemModStructSize = DllStructGetSize($lItemModStruct)



#Region Arrays
Func CheckArrayPscon($lModelID)
	For $p = 0 To (UBound($Array_pscon) -1)
		If ($lModelID == $Array_pscon[$p]) Then Return True
	Next
EndFunc

Func CheckArrayGeneralItems($lModelID)
	For $p = 0 To (UBound($General_Items_Array) -1)
		If ($lModelID == $General_Items_Array[$p]) Then Return True
	Next
EndFunc

Func CheckArrayWeaponMods($lModelID)
	For $p = 0 To (UBound($Weapon_Mod_Array) -1)
		If ($lModelID == $Weapon_Mod_Array[$p]) Then Return True
	Next
EndFunc

Func CheckArrayTomes($lModelID)
	For $p = 0 To (UBound($All_Tomes_Array) -1)
		If ($lModelID == $All_Tomes_Array[$p]) Then Return True
	Next
EndFunc

Func CheckArrayMaterials($lModelID)
	For $p = 0 To (UBound($All_Materials_Array) -1)
		If ($lModelID == $All_Materials_Array[$p]) Then Return True
	Next
EndFunc

Func CheckArrayMapPieces($lModelID)
	For $p = 0 To (UBound($Map_Piece_Array) -1)
		If ($lModelID == $Map_Piece_Array[$p]) Then Return True
	Next
EndFunc

Func UseConsets() ;Uses Consets if in inventory based on GUI checkbox and remaining effect is less than 1 minute
	$item = GetItemByModelID(24859)
	If (DllStructGetData($item, 'Bag') <> 0) And GetEffectTimeRemaining($Essence_of_Celerity_item_effect) < 60000 Then
		UseItem($item)
	EndIf
Sleep(200)
	$item = GetItemByModelID(24860)
	If (DllStructGetData($item, 'Bag') <> 0) And GetEffectTimeRemaining($Armor_of_Salvation_item_effect) < 60000 Then
		UseItem($item)
	EndIf
	Sleep(200)
	$item = GetItemByModelID(24861)
	If (DllStructGetData($item, 'Bag') <> 0) And GetEffectTimeRemaining($Grail_of_Might_item_effect) < 60000 Then
		UseItem($item)
	EndIf
	Sleep(200)
EndFunc   ;==>UseConsets

#EndRegion Arrays


#Region H&H

Func MoveHero($aX, $aY, $HeroID, $Random = 75); Parameter1 = heroID (1-7) reset flags $aX = 0x7F800000, $aY = 0x7F800000

	Switch $HeroID
		Case "All"
			CommandAll(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 1
			CommandHero1(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 2
			CommandHero2(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 3
			CommandHero3(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 4
			CommandHero4(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 5
			CommandHero5(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 6
			CommandHero6(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
		Case 7
			CommandHero7(_FloatToInt($aX) + Random(-$Random, $Random), _FloatToInt($aY) + Random(-$Random, $Random))
	EndSwitch
EndFunc   ;==>MoveHero

Func CommandHero1($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0x4), $aX, $aY, 0)
EndFunc   ;==>CommandHero1

Func CommandHero2($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0x28), $aX, $aY, 0)
EndFunc   ;==>CommandHero2

Func CommandHero3($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0x4C), $aX, $aY, 0)
EndFunc   ;==>CommandHero3

Func CommandHero4($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0x70), $aX, $aY, 0)
EndFunc   ;==>CommandHero4

Func CommandHero5($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0x94), $aX, $aY, 0)
EndFunc   ;==>CommandHero5

Func CommandHero6($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0xB8), $aX, $aY, 0)
EndFunc   ;==>CommandHero6

Func CommandHero7($aX = 0x7F800000, $aY = 0x7F800000)
	Local $lOffset[4] = [0, 0x18, 0x2C, 0x520]
	Local $lHeroStruct = MemoryReadPtr($mBasePointer, $lOffset)
	SendPacket(0x14, $HEADER_HERO_FLAG_SINGLE, MEMORYREAD($lHeroStruct[1] + 0xDC), $aX, $aY, 0)
EndFunc   ;==>CommandHero7

Func GetHeroIdByName($heroName)
    Switch $heroName
        Case "Norgu"
            Return $HERO_Norgu
        Case "Goren"
            Return $HERO_Goren
        Case "Tahlkora"
            Return $HERO_Tahlkora
        Case "Master Of Whispers"
            Return $HERO_MasterOfWhispers
        Case "Acolyte Jin"
            Return $HERO_AcolyteJin
        Case "Koss"
            Return $HERO_Koss
        Case "Dunkoro"
            Return $HERO_Dunkoro
        Case "Acolyte Sousuke"
            Return $HERO_AcolyteSousuke
        Case "Melonni"
            Return $HERO_Melonni
        Case "Zhed Shadowhoof"
            Return $HERO_ZhedShadowhoof
        Case "General Morgahn"
            Return $HERO_GeneralMorgahn
        Case "Margrid The Sly"
            Return $HERO_MargridTheSly
        Case "Olias"
            Return $HERO_Olias
        Case "Razah"
            Return $HERO_Razah
        Case "MOX"
            Return $HERO_MOX
        Case "Jora"
            Return $HERO_Jora
        Case "Pyre Fierceshot"
            Return $HERO_PyreFierceshot
        Case "Livia"
            Return $HERO_Livia
        Case "Hayda"
            Return $HERO_Hayda
        Case "Kahmu"
            Return $HERO_Kahmu
        Case "Gwen"
            Return $HERO_Gwen
        Case "Xandra"
            Return $HERO_Xandra
        Case "Vekk"
            Return $HERO_Vekk
        Case "Ogden"
            Return $HERO_Ogden
        Case "Mercenary Hero 1"
            Return $HERO_MercenaryHero1
        Case "Mercenary Hero 2"
            Return $HERO_MercenaryHero2
        Case "Mercenary Hero 3"
            Return $HERO_MercenaryHero3
        Case "Mercenary Hero 4"
            Return $HERO_MercenaryHero4
        Case "Mercenary Hero 5"
            Return $HERO_MercenaryHero5
        Case "Mercenary Hero 6"
            Return $HERO_MercenaryHero6
        Case "Mercenary Hero 7"
            Return $HERO_MercenaryHero7
        Case "Mercenary Hero 8"
            Return $HERO_MercenaryHero8
        Case Else
            Return -1 ; Hero name not found
    EndSwitch
EndFunc

#Region chest

Func OpenChestByExtraType($ExtraType)
		OpenChest()
EndFunc   ;==>OpenChestByExtraType

;~ Description: Open a chest with key.
Func OpenChestNoLockpick()
	Return SendPacket(0x8, $HEADER_CHEST_OPEN, 1)
EndFunc   ;==>OpenChestNoLockpick

;~ Description: Open a chest with lockpick.
Func OpenChest()
	Return SendPacket(0x8, $HEADER_CHEST_OPEN, 2)
EndFunc   ;==>OpenChest

Func GetAgentArraySorted($lAgentType)     ;returns a 2-dimensional array([agentID, [distance]) sorted by distance
	Local $lDistance
	Local $lAgentArray = GetAgentArray($lAgentType)
	Local $lReturnArray[1][2]
	Local $lMe = GetAgentByID(-2)
	Local $AgentID
	For $i = 1 To $lAgentArray[0]
		$lDistance = (DllStructGetData($lMe, 'X') - DllStructGetData($lAgentArray[$i], 'X')) ^ 2 + (DllStructGetData($lMe, 'Y') - DllStructGetData($lAgentArray[$i], 'Y')) ^ 2
		$AgentID = DllStructGetData($lAgentArray[$i], 'ID')
		ReDim $lReturnArray[$i][2]
		$lReturnArray[$i - 1][0] = $AgentID
		$lReturnArray[$i - 1][1] = Sqrt($lDistance)
	Next
	_ArraySort($lReturnArray, 0, 0, 0, 1)
	Return $lReturnArray
 EndFunc   ;==>GetAgentArraySorted

  ; Function to check for chests and interact with them  
Func CheckForChest($chestRun = False)  
   ; Check if the character is dead  
   If GetIsDead(-2) Then Return  
    
   ; Get all static objects  
   Local $AgentArray = GetAgentArraySorted($STATIC_AGENT_TYPE)  
   Local $lAgent = 0  
   Local $ChestFound = False  
    
   ; Look for valid chests  
   For $i = 0 To UBound($AgentArray) - 1  
      $lAgent = GetAgentByID($AgentArray[$i][0])  
       
      ; Skip if not a chest or invalid chest ID  
      If DllStructGetData($lAgent, 'Type') <> $CHEST_TYPE Or $aChestID = "" Then  
        ContinueLoop  
      EndIf  
       
      ; Check if chest was already opened  
      If Not IsChestOpened($AgentArray[$i][0]) Then  
        ; Add chest to opened list  
        AddOpenedChest($AgentArray[$i][0])  
        $ChestFound = True  
        ExitLoop  
      EndIf  
   Next  
    
   If Not $ChestFound Then Return  
    
   ; Interact with chest  
   ChangeTarget($lAgent)  
   GoSignpost($lAgent)  
   OpenChestByExtraType($aChestID)  
   Sleep(GetPing() + 500)  
    
   ; Handle loot  
   Local $ItemArray = GetAgentArraySorted($ITEM_AGENT_TYPE)  
   If UBound($ItemArray) > 0 Then  
      ChangeTarget($ItemArray[0][0])  
      PickUpLoot()  
   EndIf  
EndFunc  
  
; Function to check if a chest has been opened  
Func IsChestOpened($chestID)  
   If UBound($OpenedChestAgentIDs) = 0 Then Return False  
   Return _ArraySearch($OpenedChestAgentIDs, $chestID) <> -1  
EndFunc  
  
; Function to add a chest to the opened list  
Func AddOpenedChest($chestID)  
   If UBound($OpenedChestAgentIDs) = 0 Then  
      ReDim $OpenedChestAgentIDs[1]  
      $OpenedChestAgentIDs[0] = $chestID  
   Else  
      _ArrayAdd($OpenedChestAgentIDs, $chestID)  
   EndIf  
EndFunc

Func GetPlayerCoords()
    Return GetAgentByID(-2) ;~ Assuming -2 is the player's unique identifier, get the agent data for the player
EndFunc

Func CheckForChest2($chestrun = False)
    Local $AgentArray, $lAgent, $lType, $playerAgent
    Local $ChestFound = False
    Local $MaxDistance = 10000  ; Maximum distance to check for chests

    If GetIsDead(-2) Then Return  ; Exit if the player is dead
    $playerAgent = GetPlayerCoords()  ; Get the player agent
    $AgentArray = GetAgentArraySorted(0x200)  ; Retrieve sorted array of static type entities
    For $i = 0 To UBound($AgentArray) - 1
        $lAgent = GetAgentByID($AgentArray[$i][0])
        If Not IsDllStruct($lAgent) Then ContinueLoop  ; Validate each agent before proceeding

        $lType = DllStructGetData($lAgent, 'Type')
        If $lType <> 512 Then ContinueLoop  ; Skip non-chest agents

        $lDistance = CalculateDistance($playerAgent, $lAgent)
        If $lDistance > $MaxDistance Then ContinueLoop  ; Skip chests out of specified range

        ; Check if chest has been opened before
        If _ArraySearch($OpenedChestAgentIDs, $AgentArray[$i][0]) <> -1 Then
            ContinueLoop  ; Skip this chest as it has already been opened
        EndIf

        ; Not found in the opened chest list, proceed
        $ChestFound = True
        ChangeTarget($lAgent)
        GoSignpost($lAgent)
        OpenChestByExtraType($aChestID)
        Sleep(GetPing() + 500)

        ; Add the chest ID to the blacklist after opening
        _ArrayAdd($OpenedChestAgentIDs, $AgentArray[$i][0])

        ; Retrieve items dropped from the chest
        $AgentArray = GetAgentArraySorted(0x400)
        ChangeTarget($AgentArray[0][0])
        PickUpLoot()
    Next

    If Not $ChestFound Then Return False  ; Return False if no chests found
    Return True  ; Indicate successful operation
EndFunc   ;==>CheckForChest2


Func CalculateDistance($agent1, $agent2)
    Local $x1 = DllStructGetData($agent1, 'X')
    Local $y1 = DllStructGetData($agent1, 'Y')
    Local $x2 = DllStructGetData($agent2, 'X')
    Local $y2 = DllStructGetData($agent2, 'Y')

    Return Sqrt(($x2 - $x1) ^ 2 + ($y2 - $y1) ^ 2)
EndFunc


Func PickUpLoot2()
    If CountSlots() < 1 Then Return ; Check if inventory is full and exit if no slots are available

    If GetIsDead(-2) Then Return ; Exit the function if the player is dead

    Local $lAgent, $lItem, $lDeadlock
    For $i = 1 To GetMaxAgents() ; Loop through all agents in the area
        $lAgent = GetAgentByID($i) ; Retrieve agent data by its ID

        If DllStructGetData($lAgent, 'Type') <> 0x400 Then ContinueLoop ; Only proceed if agent type is item (0x400)
        
        $lItem = GetItemByAgentID($i) 
        If CanPickUp($lItem) Then ; Check if the item is eligible to be picked up
            PickUpItem($lItem) ; Execute the pick up item action
            $lDeadlock = TimerInit() ; Start a timer to avoid a deadlock situation

            While GetAgentExists($i) ; Loop while the item still exists
                Sleep(100) ; Small delay to reduce CPU load and allow for server response time
                If GetIsDead(-2) Then Return ; Exit if the player dies during the process

                If TimerDiff($lDeadlock) > 15000 Then ExitLoop ; Break the loop after 15 seconds to avoid infinite loop
            WEnd
        EndIf
    Next
EndFunc   ;==>PickUpLoot2

#EndRegion Chest

;=================================================================================================
; Function:			PickUpItems($iItems = -1, $fMaxDistance = 1012)
; Description:		PickUp defined number of items in defined area around default = 1012
; Parameter(s):		$iItems:	number of items to be picked
;					$fMaxDistance:	area within items should be picked up
; Requirement(s):	GW must be running and Memory must have been scanned for pointers (see Initialize())
; Return Value(s):	On Success - Returns $iItemsPicked (number of items picked)
; Author(s):		GWCA team, recoded by ddarek, thnx to The ArkanaProject
;=================================================================================================
Func PickupItems($iItems = -1, $fMaxDistance = 506)
	Local $aItemID, $lNearestDistance, $lDistance
	$tDeadlock = TimerInit()
	Do
		$aItem = GetNearestItemToAgent(-2)
		$lDistance = @extended

		$aItemID = DllStructGetData($aItem, 'ID')
		If $aItemID = 0 Or $lDistance > $fMaxDistance Or TimerDiff($tDeadlock) > 30000 Then ExitLoop
		PickUpItem($aItem)
		$tDeadlock2 = TimerInit()
		Do
			Sleep(500)
			If TimerDiff($tDeadlock2) > 5000 Then ContinueLoop 2
		Until DllStructGetData(GetAgentById($aItemID), 'ID') == 0
		$iItems_Picked += 1
		;UpdateStatus("Picked total " & $iItems_Picked & " items")
	Until $iItems_Picked = $iItems
	Return $iItems_Picked
EndFunc   ;==>PickupItems

;=================================================================================================
; Function:			GetNearestItemToAgent($aAgent)
; Description:		Get nearest item lying on floor around $aAgent ($aAgent = -2 ourself), necessary to work with PickUpItems func
; Parameter(s):		$aAgent: ID of Agent
; Requirement(s):	GW must be running and Memory must have been scanned for pointers (see Initialize())
; Return Value(s):	On Success - Returns ID of nearest item
;					@extended  - distance to item
; Author(s):		GWCA team, recoded by ddarek
;=================================================================================================



Func GetNearestItemByModelId($ModelId, $aAgent = -2 )
Local $lNearestAgent, $lNearestDistance = 100000000
	Local $lDistance, $lAgentToCompare

	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)

	For $i = 1 To GetMaxAgents()
		$lAgentToCompare = GetAgentByID($i)
		If DllStructGetData($lAgentToCompare, 'Type') <> 0x400 Then ContinueLoop
		If DllStructGetData(GetItemByAgentID($i), 'ModelID') <> $ModelId Then ContinueLoop
		$lDistance = (DllStructGetData($lAgentToCompare, 'Y') - DllStructGetData($aAgent, 'Y')) ^ 2 + (DllStructGetData($lAgentToCompare, 'X') - DllStructGetData($aAgent, 'X')) ^ 2
		If $lDistance < $lNearestDistance Then
			$lNearestAgent = $lAgentToCompare
			$lNearestDistance = $lDistance
		EndIf

	Next
	Return $lNearestAgent; return struct of Agent not item!
EndFunc   ;==>GetNearestItemByModelId


;Func GetNumberOfFoesInRangeOfAgent($aAgent = -2, $fMaxDistance = 1012)
;	Local $lDistance, $lCount = 0
;
;	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)
;	For $i = 1 To GetMaxAgents()
;		$lAgentToCompare = GetAgentByID($i)
;		If GetIsDead($lAgentToCompare) <> 0 Then ContinueLoop
;		If DllStructGetData($lAgentToCompare, 'Allegiance') = 0x3 Then
;			$lDistance = GetDistance($lAgentToCompare, $aAgent)
;			If $lDistance < $fMaxDistance Then
;				$lCount += 1
;				;ConsoleWrite("Counts: " &$lCount & @CRLF)
;			EndIf
;		EndIf
;	Next
;	Return $lCount
;EndFunc   ;==>GetNumberOfFoesInRangeOfAgent

Func GetNumberOfAlliesInRangeOfAgent($aAgent = -2, $fMaxDistance = 506)
	Local $lDistance, $lCount = 0

	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)
	For $i = 1 To GetMaxAgents()
		$lAgentToCompare = GetAgentByID($i)
		If GetIsDead($lAgentToCompare) <> 0 Then ContinueLoop
		If DllStructGetData($lAgentToCompare, 'Allegiance') = 0x1 Then
			$lDistance = GetDistance($lAgentToCompare, $aAgent)
			If $lDistance < $fMaxDistance Then
				$lCount += 1
				;ConsoleWrite("Counts: " &$lCount & @CRLF)
			EndIf
		EndIf
	Next
	Return $lCount
EndFunc   ;==>GetNumberOfAlliesInRangeOfAgent

Func GetNumberOfItemsInRangeOfAgent($aAgent = -2, $fMaxDistance = 506)
	Local $lDistance, $lCount = 0

	If IsDllStruct($aAgent) = 0 Then $aAgent = GetAgentByID($aAgent)
	For $i = 1 To GetMaxAgents()
		$lAgentToCompare = GetAgentByID($i)
		If DllStructGetData($lAgentToCompare, 'Type') = 0x400 Then
			$lDistance = GetDistance($lAgentToCompare, $aAgent)
			If $lDistance < $fMaxDistance Then
				$lCount += 1
				;ConsoleWrite("Counts: " &$lCount & @CRLF)
			EndIf
		EndIf
	Next
	Return $lCount
EndFunc   ;==>GetNumberOfItemsInRangeOfAgent

Func GetNearestEnemyToCoords($aX, $aY)
	Local $lNearestAgent, $lNearestDistance = 100000000
	Local $lDistance, $lAgentToCompare

	For $i = 1 To GetMaxAgents()
		$lAgentToCompare = GetAgentByID($i)
		If DllStructGetData($lAgentToCompare, 'HP') < 0.005 Or DllStructGetData($lAgentToCompare, 'Allegiance') <> 0x3 Then ContinueLoop

		$lDistance = ($aX - DllStructGetData($lAgentToCompare, 'X')) ^ 2 + ($aY - DllStructGetData($lAgentToCompare, 'Y')) ^ 2
		If $lDistance < $lNearestDistance Then
			$lNearestAgent = $lAgentToCompare
			$lNearestDistance = $lDistance
		EndIf
	Next

	Return $lNearestAgent
EndFunc   ;==>GetNearestAgentToCoords


;=================================================================================================
; Function:			Ident($bagIndex = 1, $numOfSlots)
; Description:		Idents items in $bagIndex, NEEDS ANY ID kit in inventory!
; Parameter(s):		$bagIndex -> check Global enums
;					$numOfSlots -> correspondend number of slots in $bagIndex
; Requirement(s):	GW must be running and Memory must have been scanned for pointers (see Initialize())
; Return Value(s):
; Author(s):		GWCA team, recoded by ddarek, thnx to The ArkanaProject
;=================================================================================================


;=================================================================================================
; Function:			CanSell($aItem); only part of it can do
; Description:		general precaution not to sell things we want to save; ModelId page = http://wiki.gamerevision.com/index.php/Model_IDs
; Parameter(s):		$aItem-object
;
; Requirement(s):	GW must be running and Memory must have been scanned for pointers (see Initialize())
; Return Value(s):	On Success - Returns boolean
; Author(s):		GWCA team, recoded by ddarek, thnx to The ArkanaProject
;=================================================================================================


;=================================================================================================
; Function:			Sell($bagIndex, $numOfSlots)
; Description:		Sell items in $bagIndex, need open Dialog with Trader!
; Parameter(s):		$bagIndex -> check Global enums
;					$numOfSlots -> correspondend number of slots in $bagIndex
; Requirement(s):	GW must be running and Memory must have been scanned for pointers (see Initialize())
; Return Value(s):
; Author(s):		GWCA team, recoded by ddarek, thnx to The ArkanaProject
;=================================================================================================



Func GetExtraItemInfoBySlot($aBag, $aSlot)
	$item = GetItembySlot($aBag, $aSlot)
	$lItemExtraPtr = DllStructGetData($item, "ModPtr")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraPtr, 'ptr', $lItemExtraStructPtr, 'int', $lItemExtraStructSize, 'int', '')
	Return $lItemExtraStruct
	;ConsoleWrite($rarity & @CRLF)
EndFunc   ;==>GetExtraInfoBySlot

Func GetEtraItemInfoByItemId($aItem)
	$item = GetItemByItemID($aItem)
	$lItemExtraPtr = DllStructGetData($item, "ModPtr")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraPtr, 'ptr', $lItemExtraStructPtr, 'int', $lItemExtraStructSize, 'int', '')
	Return $lItemExtraStruct
EndFunc   ;==>GetEtraInfoByItemId

Func GetEtraItemInfoByAgentId($aItem)
	$item = GetItemByAgentID($aItem)
	$lItemExtraPtr = DllStructGetData($item, "ModPtr")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraPtr, 'ptr', $lItemExtraStructPtr, 'int', $lItemExtraStructSize, 'int', '')
	Return $lItemExtraStruct
EndFunc   ;==>GetEtraInfoByAgentId

Func GetEtraItemInfoByModelId($aItem)
	$item = GetItemByModelID($aItem)
	$lItemExtraPtr = DllStructGetData($item, "ModPtr")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraPtr, 'ptr', $lItemExtraStructPtr, 'int', $lItemExtraStructSize, 'int', '')
	Return $lItemExtraStruct
EndFunc   ;==>GetEtraInfoByModelId

Func GetExtraItemReqBySlot($aBag, $aSlot)
	$item = GetItembySlot($aBag, $aSlot)
	$lItemExtraReqPtr = DllStructGetData($item, "extraItemReq")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraReqPtr, 'ptr', $lItemExtraReqStructPtr, 'int', $lItemExtraReqStructSize, 'int', '')
	Return $lItemExtraReqStruct
	;ConsoleWrite($rarity & @CRLF)
EndFunc   ;==>GetExtraItemReqBySlot

Func GetEtraItemReqByItemId($aItem)
	$item = GetItemByItemID($aItem)
	$lItemExtraReqPtr = DllStructGetData($item, "extraItemReq")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraReqPtr, 'ptr', $lItemExtraReqStructPtr, 'int', $lItemExtraReqStructSize, 'int', '')
	Return $lItemExtraReqStruct
EndFunc   ;==>GetEtraItemReqByItemId

Func GetEtraItemReqByAgentId($aItem)
	$item = GetItemByAgentID($aItem)
	$lItemExtraReqPtr = DllStructGetData($item, "extraItemReq")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraReqPtr, 'ptr', $lItemExtraReqStructPtr, 'int', $lItemExtraReqStructSize, 'int', '')
	Return $lItemExtraReqStruct
EndFunc   ;==>GetEtraItemReqByAgentId

Func GetEtraItemReqByModelId($aItem)
	$item = GetItemByModelID($aItem)
	$lItemExtraReqPtr = DllStructGetData($item, "extraItemReq")

	DllCall($mHandle[0], 'int', 'ReadProcessMemory', 'int', $mHandle[1], 'int', $lItemExtraReqPtr, 'ptr', $lItemExtraReqStructPtr, 'int', $lItemExtraReqStructSize, 'int', '')
	Return $lItemExtraReqStruct
EndFunc   ;==>GetEtraItemReqByModelId

Func FindEmptySlot($bagIndex) ;Parameter = bag index to start searching from. Returns integer with item slot. This function also searches the storage. If any of the returns = 0, then no empty slots were found
	Local $lItemInfo, $aSlot

	For $aSlot = 1 To DllStructGetData(GetBag($bagIndex), 'Slots')
		Sleep(40)
		ConsoleWrite("Checking: " & $bagIndex & ", " & $aSlot & @CRLF)
		$lItemInfo = GetItemBySlot($bagIndex, $aSlot)
		If DllStructGetData($lItemInfo, 'ID') = 0 Then
			ConsoleWrite($bagIndex & ", " & $aSlot & "  <-Empty! " & @CRLF)
			SetExtended($aSlot)
			ExitLoop
		EndIf
	Next
	Return 0
EndFunc   ;==>FindEmptySlot
#Region Misc

Func GetHPPips($aAgent = -2); Thnx to The Arkana Project
   If IsDllStruct($aAgent) == 0 Then $aAgent = GetAgentByID($aAgent)
   Return Round(DllStructGetData($aAgent, 'hppips') * DllStructGetData($aAgent, 'maxhp') / 2, 0)
EndFunc


Func GetTeam($aTeam); Thnx to The Arkana Project. Only works in PvP!
	Local $lTeamNumber
	Local $lTeam[1][2]
	Local $lTeamSmall[1] = [0]
	Local $lAgent
	If IsString($aTeam) Then
		Switch $aTeam
			Case "Blue"
				$lTeamNumber = 1
			Case "Red"
				$lTeamNumber = 2
			Case "Yellow"
				$lTeamNumber = 3
			Case "Purple"
				$lTeamNumber = 4
			Case "Cyan"
				$lTeamNumber = 5
			Case Else
				$lTeamNumber = 0
		EndSwitch
	Else
		$lTeamNumber = $aTeam
	EndIf
	$lTeam[0][0] = 0
	$lTeam[0][1] = $lTeamNumber
	If $lTeamNumber == 0 Then Return $lTeamSmall
	For $i = 1 To GetMaxAgents()
		$lAgent = GetAgentByID($i)
		If DllStructGetData($lAgent, 'ID') == 0 Then ContinueLoop
		If GetIsLiving($lAgent) And DllStructGetData($lAgent, 'Team') == $lTeamNumber And (DllStructGetData($lAgent, 'LoginNumber') <> 0 Or StringRight(GetAgentName($lAgent), 9) == "Henchman]") Then
			$lTeam[0][0] += 1
			ReDim $lTeam[$lTeam[0][0]+1][2]
			$lTeam[$lTeam[0][0]][0] = DllStructGetData($lAgent, 'id')
			$lTeam[$lTeam[0][0]][1] = DllStructGetData($lAgent, 'PlayerNumber')
		EndIf
	Next
	_ArraySort($lTeam, 0, 1, 0, 1)
	Redim $lTeamSmall[$lTeam[0][0]+1]
	For $i = 0 To $lTeam[0][0]
		$lTeamSmall[$i] = $lTeam[$i][0]
	Next
	Return $lTeamSmall
EndFunc

Func FormatName($aAgent); Thnx to The Arkana Project. Only works in PvP!
	If IsDllStruct($aAgent) == 0 Then $aAgent = GetAgentByID($aAgent)
	Local $lString
	Switch DllStructGetData($aAgent, 'Primary')
		Case 1
			$lString &= "W"
		Case 2
			$lString &= "R"
		Case 3
			$lString &= "Mo"
		Case 4
			$lString &= "N"
		Case 5
			$lString &= "Me"
		Case 6
			$lString &= "E"
		Case 7
			$lString &= "A"
		Case 8
			$lString &= "Rt"
		Case 9
			$lString &= "P"
		Case 10
			$lString &= "D"
	EndSwitch
	Switch DllStructGetData($aAgent, 'Secondary')
		Case 1
			$lString &= "/W"
		Case 2
			$lString &= "/R"
		Case 3
			$lString &= "/Mo"
		Case 4
			$lString &= "/N"
		Case 5
			$lString &= "/Me"
		Case 6
			$lString &= "/E"
		Case 7
			$lString &= "/A"
		Case 8
			$lString &= "/Rt"
		Case 9
			$lString &= "/P"
		Case 10
			$lString &= "/D"
	EndSwitch
	$lString &= " - "
	If DllStructGetData($aAgent, 'LoginNumber') > 0 Then
		$lString &= GetPlayerName($aAgent)
	Else
		$lString &= StringReplace(GetAgentName($aAgent), "Corpse of ", "")
	EndIf
	Return $lString
EndFunc

; #FUNCTION: Death ==============================================================================================================
; Description ...: Checks the dead
; Syntax.........: Death()
; Parameters ....:
; Author(s):		Syc0n
; ===============================================================================================================================
Func Death()
	If DllStructGetData(GetAgentByID(-2), "Effects") = 0x0010 Then
		Return 1	; Whatever you want to put here in case of death
	Else
		Return 0
	EndIf
EndFunc   ;==>Death

; #FUNCTION: RndSlp =============================================================================================================
; Description ...: RandomSleep (5% Variation) with Deathcheck
; Syntax.........: RndSlp(§wert)
; Parameters ....: $val = Sleeptime
; Author(s):		Syc0n
; ===============================================================================================================================

Func RNDSLP($val)
	$wert = Random($val * 0.95, $val * 1.05, 1)
	If $wert > 45000 Then
		For $i = 0 To 6
			Sleep($wert / 6)
			DEATH()
		Next
	ElseIf $wert > 36000 Then
		For $i = 0 To 5
			Sleep($wert / 5)
			DEATH()
		Next
	ElseIf $wert > 27000 Then
		For $i = 0 To 4
			Sleep($wert / 4)
			DEATH()
		Next
	ElseIf $wert > 18000 Then
		For $i = 0 To 3
			Sleep($wert / 3)
			DEATH()
		Next
	ElseIf $wert >= 9000 Then
		For $i = 0 To 2
			Sleep($wert / 2)
			DEATH()
		Next
	Else
		Sleep($wert)
		DEATH()
	EndIf
EndFunc   ;==>RndSlp

; #FUNCTION: Slp ================================================================================================================
; Description ...: Sleep with Deathcheck
; Syntax.........: Slp(§wert)
; Parameters ....: $wert = Sleeptime
; ===============================================================================================================================

Func SLP($val)
	If $val > 45000 Then
		For $i = 0 To 6
			Sleep($val / 6)
			DEATH()
		Next
	ElseIf $val > 36000 Then
		For $i = 0 To 5
			Sleep($val / 5)
			DEATH()
		Next
	ElseIf $val > 27000 Then
		For $i = 0 To 4
			Sleep($val / 4)
			DEATH()
		Next
	ElseIf $val > 18000 Then
		For $i = 0 To 3
			Sleep($val / 3)
			DEATH()
		Next
	ElseIf $val >= 9000 Then
		For $i = 0 To 2
			Sleep($val / 2)
			DEATH()
		Next
	Else
		Sleep($val)
		DEATH()
	EndIf
EndFunc   ;==>Slp

Func _FloatToInt($fFloat)
	Local $tFloat, $tInt

	$tFloat = DllStructCreate("float")
	$tInt = DllStructCreate("int", DllStructGetPtr($tFloat))
	DllStructSetData($tFloat, 1, $fFloat)
	Return DllStructGetData($tInt, 1)

EndFunc   ;==>_FloatToInt

Func _IntToFloat($fInt)
	Local $tFloat, $tInt

	$tInt = DllStructCreate("int")
	$tFloat = DllStructCreate("float", DllStructGetPtr($tInt))
	DllStructSetData($tInt, 1, $fInt)
	Return DllStructGetData($tFloat, 1)

EndFunc   ;==>_IntToFloat


Func PingSleep($msExtra = 0)
	$ping = GetPing()
	Sleep($ping + $msExtra)
EndFunc   ;==>PingSleep

Func ComputeDistanceEx($x1, $y1, $x2, $y2)
	Return Sqrt(($y2 - $y1) ^ 2 + ($x2 - $x1) ^ 2)
	$dist = Sqrt(($y2 - $y1) ^ 2 + ($x2 - $x1) ^ 2)
	ConsoleWrite("Distance: " & $dist & @CRLF)

EndFunc   ;==>ComputeDistanceEx

Func GoNearestNPCToCoords($aX, $aY)
	Local $NPC
	MoveTo($aX, $aY)
	$NPC = GetNearestNPCToCoords($aX, $aY)
	Do
		RndSleep(250)
		GoNPC($NPC)
	Until GetDistance($NPC, -2) < 250
	RndSleep(500)
EndFunc

Func IsBlackDye($aModelID, $aExtraID)
	If $aModelID == $model_id_dye Then
		Switch $aExtraID
			Case $item_extraid_black_dye
				Return True
			Case Else
				Return False
		EndSwitch
	EndIf
EndFunc ;==>IsBlackDye

Func IsWhiteDye($aModelID, $aExtraID)
	If $aModelID == $model_id_dye Then
		Switch $aExtraID
			Case $ITEM_ExtraID_WhiteDye
				Return True
			Case Else
				Return False
		EndSwitch
	EndIf
EndFunc ;==>IsBlackDye

#EndRegion Misc