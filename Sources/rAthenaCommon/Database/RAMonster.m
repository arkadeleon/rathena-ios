//
//  RAMonster.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAMonster.h"
#import "Enum/RASize.h"
#import "Enum/RARace.h"
#import "Enum/RARaceGroup.h"
#import "Enum/RAElement.h"
#import "Enum/RAMonsterAi.h"
#import "Enum/RAMonsterClass.h"
#import "Enum/RAMonsterMode.h"

const NSInteger RAMonsterWalkSpeedFastest = 20;
const NSInteger RAMonsterWalkSpeedNormal = 150;
const NSInteger RAMonsterWalkSpeedSlowest = 1000;

@implementation RAMonster

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"monsterID"        : @"Id",
        @"aegisName"        : @"AegisName",
        @"name"             : @"Name",
        @"japaneseName"     : @"JapaneseName",
        @"level"            : @"Level",
        @"hp"               : @"Hp",
        @"sp"               : @"Sp",
        @"baseExp"          : @"BaseExp",
        @"jobExp"           : @"JobExp",
        @"mvpExp"           : @"MvpExp",
        @"attack"           : @"Attack",
        @"attack2"          : @"Attack2",
        @"defense"          : @"Defense",
        @"magicDefense"     : @"MagicDefense",
        @"resistance"       : @"Resistance",
        @"magicResistance"  : @"MagicResistance",
        @"strength"         : @"Str",
        @"agility"          : @"Agi",
        @"vitality"         : @"Vit",
        @"intelligence"     : @"Int",
        @"dexterity"        : @"Dex",
        @"luck"             : @"Luk",
        @"attackRange"      : @"AttackRange",
        @"skillRange"       : @"SkillRange",
        @"chaseRange"       : @"ChaseRange",
        @"elementLevel"     : @"ElementLevel",
        @"walkSpeed"        : @"WalkSpeed",
        @"attackDelay"      : @"AttackDelay",
        @"attackMotion"     : @"AttackMotion",
        @"damageMotion"     : @"DamageMotion",
        @"damageTaken"      : @"DamageTaken",
        @"mvpDrops"         : @"MvpDrops",
        @"drops"            : @"Drops",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"mvpDrops" : [RAMonsterDrop class],
        @"drops"    : [RAMonsterDrop class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _level = 1;
        _hp = 1;
        _sp = 1;
        _baseExp = 0;
        _jobExp = 0;
        _mvpExp = 0;
        _attack = 0;
        _attack2 = 0;
        _defense = 0;
        _magicDefense = 0;
        _resistance = 0;
        _magicResistance = 0;
        _strength = 1;
        _agility = 1;
        _vitality = 1;
        _intelligence = 1;
        _dexterity = 1;
        _luck = 1;
        _attackRange = 0;
        _skillRange = 0;
        _chaseRange = 0;
        _elementLevel = 1;
        _walkSpeed = RAMonsterWalkSpeedNormal;
        _attackDelay = 0;
        _attackMotion = 0;
        _damageMotion = 0;
        _damageTaken = 100;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Size
    NSString *size = dic[@"Size"] ?: @"";
    self.size = [RASize valueOfName:size] ?: RASize.small;

    // Race
    NSString *race = dic[@"Race"] ?: @"";
    self.race = [RARace valueOfName:race] ?: RARace.formless;

    // RaceGroups
    NSDictionary<NSString *, NSNumber *> *raceGroups = dic[@"RaceGroups"] ?: @{};
    self.raceGroups = [RARaceGroup valuesOfNames:raceGroups];

    // Element
    NSString *element = dic[@"Element"] ?: @"";
    self.element = [RAElement valueOfName:element] ?: RAElement.neutral;

    // Ai
    NSString *ai = dic[@"Ai"] ?: @"";
    self.ai = [RAMonsterAi valueOfName:ai] ?: RAMonsterAi.ai06;

    // Class
    NSString *monsterClass = dic[@"Class"] ?: @"";
    self.monsterClass = [RAMonsterClass valueOfName:monsterClass] ?: RAMonsterClass.normal;

    // Modes
    NSDictionary<NSString *, NSNumber *> *modes = dic[@"Modes"] ?: @{};
    self.modes = [RAMonsterMode valuesOfNames:modes];

    return YES;
}

@end

@implementation RAMonsterDrop

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"item"                 : @"Item",
        @"rate"                 : @"Rate",
        @"stealProtected"       : @"StealProtected",
        @"randomOptionGroup"    : @"RandomOptionGroup",
        @"index"                : @"Index",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _stealProtected = false;
    }
    return self;
}

@end