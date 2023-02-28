//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import "RAItemDatabase.h"
#import "RADatabaseParser.h"
#import "YYModel/YYModel.h"

@implementation RAItem

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"itemID"       : @"Id",
        @"aegisName"    : @"AegisName",
        @"name"         : @"Name",
        @"type"         : @"Type",
        @"subType"      : @"SubType",
        @"buy"          : @"Buy",
        @"sell"         : @"Sell",
        @"weight"       : @"Weight",
        @"attack"       : @"Attack",
        @"magicAttack"  : @"MagicAttack",
        @"defense"      : @"Defense",
        @"range"        : @"Range",
        @"slots"        : @"Slots",
        @"jobs"         : @"Jobs",
        @"classes"      : @"Classes",
        @"gender"       : @"Gender",
        @"locations"    : @"Locations",
        @"weaponLevel"  : @"WeaponLevel",
        @"armorLevel"   : @"ArmorLevel",
        @"equipLevelMin": @"EquipLevelMin",
        @"equipLevelMax": @"EquipLevelMax",
        @"refineable"   : @"Refineable",
        @"gradable"     : @"Gradable",
        @"view"         : @"View",
        @"aliasName"    : @"AliasName",
        @"flags"        : @"Flags",
        @"delay"        : @"Delay",
        @"stack"        : @"Stack",
        @"noUse"        : @"NoUse",
        @"trade"        : @"Trade",
        @"script"       : @"Script",
        @"equipScript"  : @"EquipScript",
        @"unEquipScript": @"UnEquipScript",
    };
}

+ (NSNumber *)typeFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *typeMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        typeMap = @{
            @"Healing"     .lowercaseString : @(RAItemTypeHealing),
            @"Usable"      .lowercaseString : @(RAItemTypeUsable),
            @"Etc"         .lowercaseString : @(RAItemTypeEtc),
            @"Armor"       .lowercaseString : @(RAItemTypeArmor),
            @"Weapon"      .lowercaseString : @(RAItemTypeWeapon),
            @"Card"        .lowercaseString : @(RAItemTypeCard),
            @"PetEgg"      .lowercaseString : @(RAItemTypePetEgg),
            @"PetArmor"    .lowercaseString : @(RAItemTypePetArmor),
            @"Ammo"        .lowercaseString : @(RAItemTypeAmmo),
            @"DelayConsume".lowercaseString : @(RAItemTypeDelayConsume),
            @"ShadowGear"  .lowercaseString : @(RAItemTypeShadowGear),
            @"Cash"        .lowercaseString : @(RAItemTypeCash),
        };
    });

    if (string == nil) {
        return nil;
    }

    NSNumber *type = typeMap[string.lowercaseString];
    return type;
}

+ (NSNumber *)subTypeFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *subTypeMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        subTypeMap = @{
            @"Fist"       .lowercaseString : @(RAItemSubTypeFist),
            @"Dagger"     .lowercaseString : @(RAItemSubTypeDagger),
            @"1hsword"    .lowercaseString : @(RAItemSubTypeOneHandedSword),
            @"2hsword"    .lowercaseString : @(RAItemSubTypeTwoHandedSword),
            @"1hspear"    .lowercaseString : @(RAItemSubTypeOneHandedSpear),
            @"2hspear"    .lowercaseString : @(RAItemSubTypeTwoHandedSpear),
            @"1haxe"      .lowercaseString : @(RAItemSubTypeOneHandedAxe),
            @"2haxe"      .lowercaseString : @(RAItemSubTypeTwoHandedAxe),
            @"Mace"       .lowercaseString : @(RAItemSubTypeMace),
            @"Staff"      .lowercaseString : @(RAItemSubTypeStaff),
            @"Bow"        .lowercaseString : @(RAItemSubTypeBow),
            @"Knuckle"    .lowercaseString : @(RAItemSubTypeKnuckle),
            @"Musical"    .lowercaseString : @(RAItemSubTypeMusical),
            @"Whip"       .lowercaseString : @(RAItemSubTypeWhip),
            @"Book"       .lowercaseString : @(RAItemSubTypeBook),
            @"Katar"      .lowercaseString : @(RAItemSubTypeKatar),
            @"Revolver"   .lowercaseString : @(RAItemSubTypeRevolver),
            @"Rifle"      .lowercaseString : @(RAItemSubTypeRifle),
            @"Gatling"    .lowercaseString : @(RAItemSubTypeGatling),
            @"Shotgun"    .lowercaseString : @(RAItemSubTypeShotgun),
            @"Grenade"    .lowercaseString : @(RAItemSubTypeGrenade),
            @"Huuma"      .lowercaseString : @(RAItemSubTypeHuuma),
            @"2hstaff"    .lowercaseString : @(RAItemSubTypeTwoHandedStaff),
            @"Arrow"      .lowercaseString : @(RAItemSubTypeArrow),
            @"Bullet"     .lowercaseString : @(RAItemSubTypeBullet),
            @"Shell"      .lowercaseString : @(RAItemSubTypeShell),
            @"Shuriken"   .lowercaseString : @(RAItemSubTypeShuriken),
            @"Kunai"      .lowercaseString : @(RAItemSubTypeKunai),
            @"Cannonball" .lowercaseString : @(RAItemSubTypeCannonball),
            @"ThrowWeapon".lowercaseString : @(RAItemSubTypeThrowWeapon),
            @"Normal"     .lowercaseString : @(RAItemSubTypeNormal),
            @"Enchant"    .lowercaseString : @(RAItemSubTypeEnchant),
        };
    });

    if (string == nil) {
        return nil;
    }

    NSNumber *subType = subTypeMap[string.lowercaseString];
    return subType;
}

+ (RAItemJob)jobsFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *jobMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jobMap = @{
            @"Acolyte"      .lowercaseString : @(RAItemJobAcolyte),
            @"Alchemist"    .lowercaseString : @(RAItemJobAlchemist),
            @"Archer"       .lowercaseString : @(RAItemJobArcher),
            @"Assassin"     .lowercaseString : @(RAItemJobAssassin),
            @"BardDancer"   .lowercaseString : @(RAItemJobBardDancer),
            @"Blacksmith"   .lowercaseString : @(RAItemJobBlacksmith),
            @"Crusader"     .lowercaseString : @(RAItemJobCrusader),
            @"Gunslinger"   .lowercaseString : @(RAItemJobGunslinger),
            @"Hunter"       .lowercaseString : @(RAItemJobHunter),
            @"KagerouOboro" .lowercaseString : @(RAItemJobKagerouOboro),
            @"Knight"       .lowercaseString : @(RAItemJobKnight),
            @"Mage"         .lowercaseString : @(RAItemJobMage),
            @"Merchant"     .lowercaseString : @(RAItemJobMerchant),
            @"Monk"         .lowercaseString : @(RAItemJobMonk),
            @"Ninja"        .lowercaseString : @(RAItemJobNinja),
            @"Novice"       .lowercaseString : @(RAItemJobNovice),
            @"Priest"       .lowercaseString : @(RAItemJobPriest),
            @"Rebellion"    .lowercaseString : @(RAItemJobRebellion),
            @"Rogue"        .lowercaseString : @(RAItemJobRogue),
            @"Sage"         .lowercaseString : @(RAItemJobSage),
            @"SoulLinker"   .lowercaseString : @(RAItemJobSoulLinker),
            @"StarGladiator".lowercaseString : @(RAItemJobStarGladiator),
            @"Summoner"     .lowercaseString : @(RAItemJobSummoner),
            @"SuperNovice"  .lowercaseString : @(RAItemJobSuperNovice),
            @"Swordman"     .lowercaseString : @(RAItemJobSwordman),
            @"Taekwon"      .lowercaseString : @(RAItemJobTaekwon),
            @"Thief"        .lowercaseString : @(RAItemJobThief),
            @"Wizard"       .lowercaseString : @(RAItemJobWizard),
            @"All"          .lowercaseString : @(RAItemJobAll),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemJob jobs = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL *stop) {
        NSNumber *job = jobMap[key.lowercaseString];
        if (job && obj.boolValue == YES) {
            jobs |= job.unsignedIntegerValue;
        }
    }];

    return jobs;
}

+ (RAItemClass)classesFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *classMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classMap = @{
            @"Normal"     .lowercaseString : @(RAItemClassNormal),
            @"Upper"      .lowercaseString : @(RAItemClassUpper),
            @"Baby"       .lowercaseString : @(RAItemClassBaby),
            @"Third"      .lowercaseString : @(RAItemClassThird),
            @"Third_Upper".lowercaseString : @(RAItemClassThirdUpper),
            @"Third_Baby" .lowercaseString : @(RAItemClassThirdBaby),
            @"Fourth"     .lowercaseString : @(RAItemClassFourth),
            @"All_Upper"  .lowercaseString : @(RAItemClassAllUpper),
            @"All_Baby"   .lowercaseString : @(RAItemClassAllBaby),
            @"All_Third"  .lowercaseString : @(RAItemClassAllThird),
            @"All"        .lowercaseString : @(RAItemClassAll),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemClass classes = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL *stop) {
        NSNumber *itemClass = classMap[key.lowercaseString];
        if (itemClass && obj.boolValue == YES) {
            classes |= itemClass.unsignedIntegerValue;
        }
    }];

    return classes;
}

+ (NSNumber *)genderFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *genderMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        genderMap = @{
            @"Female".lowercaseString : @(RAItemGenderFemale),
            @"Male"  .lowercaseString : @(RAItemGenderMale),
            @"Both"  .lowercaseString : @(RAItemGenderBoth),
        };
    });

    if (string == nil) {
        return nil;
    }

    NSNumber *gender = genderMap[string.lowercaseString];
    return gender;
}

+ (RAItemLocation)locationsFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *locationMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationMap = @{
            @"Head_Top"              .lowercaseString : @(RAItemLocationHeadTop),
            @"Head_Mid"              .lowercaseString : @(RAItemLocationHeadMid),
            @"Head_Low"              .lowercaseString : @(RAItemLocationHeadLow),
            @"Armor"                 .lowercaseString : @(RAItemLocationArmor),
            @"Right_Hand"            .lowercaseString : @(RAItemLocationRightHand),
            @"Left_Hand"             .lowercaseString : @(RAItemLocationLeftHand),
            @"Garment"               .lowercaseString : @(RAItemLocationGarment),
            @"Shoes"                 .lowercaseString : @(RAItemLocationShoes),
            @"Right_Accessory"       .lowercaseString : @(RAItemLocationRightAccessory),
            @"Left_Accessory"        .lowercaseString : @(RAItemLocationLeftAccessory),
            @"Costume_Head_Top"      .lowercaseString : @(RAItemLocationCostumeHeadTop),
            @"Costume_Head_Mid"      .lowercaseString : @(RAItemLocationCostumeHeadMid),
            @"Costume_Head_Low"      .lowercaseString : @(RAItemLocationCostumeHeadLow),
            @"Costume_Garment"       .lowercaseString : @(RAItemLocationCostumeGarment),
            @"Ammo"                  .lowercaseString : @(RAItemLocationAmmo),
            @"Shadow_Armor"          .lowercaseString : @(RAItemLocationShadowArmor),
            @"Shadow_Weapon"         .lowercaseString : @(RAItemLocationShadowWeapon),
            @"Shadow_Shield"         .lowercaseString : @(RAItemLocationShadowShield),
            @"Shadow_Shoes"          .lowercaseString : @(RAItemLocationShadowShoes),
            @"Shadow_Right_Accessory".lowercaseString : @(RAItemLocationShadowRightAccessory),
            @"Shadow_Left_Accessory" .lowercaseString : @(RAItemLocationShadowLeftAccessory),
            @"Both_Hand"             .lowercaseString : @(RAItemLocationBothHand),
            @"Both_Accessory"        .lowercaseString : @(RAItemLocationBothAccessory),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemLocation locations = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL *stop) {
        NSNumber *location = locationMap[key.lowercaseString];
        if (location && obj.boolValue == YES) {
            locations |= location.unsignedIntegerValue;
        }
    }];

    return locations;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _type = RAItemTypeEtc;
        _subType = RAItemSubTypeNone;
        _buy = 0;
        _sell = 0;
        _weight = 0;
        _attack = 0;
        _magicAttack = 0;
        _defense = 0;
        _range = 0;
        _slots = 0;
        _jobs = RAItemJobAll;
        _classes = RAItemClassAll;
        _gender = RAItemGenderBoth;
        _locations = 0;
        _weaponLevel = 1;
        _armorLevel = 1;
        _equipLevelMin = 0;
        _equipLevelMax = 0;
        _refineable = NO;
        _gradable = NO;
        _view = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *type = [RAItem typeFromString:dic[@"Type"]];
    if (type) {
        _type = type.integerValue;
    }

    NSNumber *subType = [RAItem subTypeFromString:dic[@"SubType"]];
    if (subType) {
        _subType = subType.integerValue;
    }

    _jobs = [RAItem jobsFromDictionary:dic[@"Jobs"]];

    _classes = [RAItem classesFromDictionary:dic[@"Classes"]];

    NSNumber *gender = [RAItem genderFromString:dic[@"Gender"]];
    if (gender) {
        _gender = gender.integerValue;
    }

    _locations = [RAItem locationsFromDictionary:dic[@"Locations"]];

    return YES;
}

@end

@implementation RAItemFlags

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"buyingStore"  : @"BuyingStore",
        @"deadBranch"   : @"DeadBranch",
        @"container"    : @"Container",
        @"uniqueId"     : @"UniqueId",
        @"bindOnEquip"  : @"BindOnEquip",
        @"dropAnnounce" : @"DropAnnounce",
        @"noConsume"    : @"NoConsume",
        @"dropEffect"   : @"DropEffect",
    };
}

@end

@implementation RAItemDelay

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"duration" : @"Duration",
        @"status"   : @"Status",
    };
}

@end

@implementation RAItemStack

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"amount"       : @"Amount",
        @"inventory"    : @"Inventory",
        @"cart"         : @"Cart",
        @"storage"      : @"Storage",
        @"guildStorage" : @"GuildStorage",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _inventory = YES;
        _cart = NO;
        _storage = NO;
        _guildStorage = NO;
    }
    return self;
}

@end

@implementation RAItemNoUse

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"override" : @"Override",
        @"sitting"  : @"Sitting",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _override = 100;
        _sitting = NO;
    }
    return self;
}

@end

@implementation RAItemTrade

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"override"         : @"Override",
        @"noDrop"           : @"NoDrop",
        @"noTrade"          : @"NoTrade",
        @"tradePartner"     : @"TradePartner",
        @"noSell"           : @"NoSell",
        @"noCart"           : @"NoCart",
        @"noStorage"        : @"NoStorage",
        @"noGuildStorage"   : @"NoGuildStorage",
        @"noMail"           : @"NoMail",
        @"noAuction"        : @"NoAuction",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _override = 100;
        _noDrop = NO;
        _noTrade = NO;
        _tradePartner = NO;
        _noSell = NO;
        _noCart = NO;
        _noStorage = NO;
        _noGuildStorage = NO;
        _noMail = NO;
        _noAuction = NO;
    }
    return self;
}

@end

@interface RAItemDatabase () <RADatabaseParserDelegate>

@property (nonatomic) NSMutableArray<RAItem *> *allItems;

@end

@implementation RAItemDatabase

- (instancetype)init {
    self = [super init];
    if (self) {
        _allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchAllItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseParser *parser;

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_usable.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_equip.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_etc.yml"];
        parser.delegate = self;
        [parser parse];

        completionHandler([self.allItems copy]);
    });
}

#pragma mark - RADatabaseParserDelegate

- (void)parser:(RADatabaseParser *)parser foundElement:(NSDictionary *)element {
    RAItem *item = [RAItem yy_modelWithJSON:element];
    [self.allItems addObject:item];
}

@end
