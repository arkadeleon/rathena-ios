//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import "RAItemDatabase.h"
#include "map/itemdb.hpp"

@interface RAItem2 ()

- (instancetype)initWithItem:(std::shared_ptr<item_data>)item;

@end

@implementation RAItemDatabase

- (void)fetchItemsWithCompletionHandler:(void (^)(NSArray<RAItem2 *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<RAItem2 *> *items = [NSMutableArray arrayWithCapacity:item_db.size()];
        for (auto entry = item_db.begin(); entry != item_db.end(); ++entry) {
            RAItem2 *item = [[RAItem2 alloc] initWithItem:entry->second];
            [items addObject:item];
        }

        completionHandler([items copy]);
    });
}

@end

@implementation RAItem2

- (instancetype)initWithItem:(std::shared_ptr<item_data>)item {
    self = [super init];
    if (self) {
        _itemID = item->nameid;
        _aegisName = [NSString stringWithUTF8String:item->name.c_str()];
        _name = [NSString stringWithUTF8String:item->ename.c_str()];
        _type = item->type;
        _subType = item->subtype;
        _buy = item->value_buy;
        _sell = item->value_sell;
        _weight = item->weight;
        _attack = item->atk;
#ifdef RENEWAL
        _magicAttack = item->matk;
#endif
        _defense = item->def;
        _range = item->range;
        _slots = item->slots;
        _jobs11 = item->class_base[0];
        _jobs21 = item->class_base[1];
        _jobs22 = item->class_base[2];
        _classes = item->class_upper;
        _gender = item->sex;
        _locations = item->equip;
        _weaponLevel = item->weapon_level;
        _armorLevel = item->armor_level;
        _equipLevelMin = item->elv;
        _equipLevelMax = item->elvmax;
        _refineable = !item->flag.no_refine;
        _gradable = item->flag.gradable;
        _view = item->look;
//        _aliasName = item->view_id;

        _flags = [[RAItemFlags2 alloc] init];
        _flags.buyingStore = item->flag.buyingstore;
        _flags.deadBranch = item->flag.dead_branch;
        _flags.container = item->flag.group;
        _flags.uniqueId = item->flag.guid;
        _flags.bindOnEquip = item->flag.bindOnEquip;
        _flags.dropAnnounce = item->flag.broadcast;
        _flags.noConsume = (item->flag.delay_consume & DELAYCONSUME_NOCONSUME) != 0;
        _flags.dropEffect = item->flag.dropEffect;

        _delay = [[RAItemDelay2 alloc] init];
        _delay.duration = item->delay.duration;
        _delay.status = item->delay.sc;

        _stack = [[RAItemStack2 alloc] init];
        _stack.amount = item->stack.amount;
        _stack.inventory = item->stack.inventory;
        _stack.cart = item->stack.cart;
        _stack.storage = item->stack.storage;
        _stack.guildStorage = item->stack.guild_storage;

        _noUse = [[RAItemNoUse2 alloc] init];
        _noUse.override = item->item_usage.override;
        _noUse.sitting = item->item_usage.sitting;

        _trade = [[RAItemTrade2 alloc] init];
        _trade.override = item->gm_lv_trade_override;
        _trade.noDrop = item->flag.trade_restriction.drop;
        _trade.noTrade = item->flag.trade_restriction.trade;
        _trade.tradePartner = item->flag.trade_restriction.trade_partner;
        _trade.noSell = item->flag.trade_restriction.sell;
        _trade.noCart = item->flag.trade_restriction.cart;
        _trade.noStorage = item->flag.trade_restriction.storage;
        _trade.noGuildStorage = item->flag.trade_restriction.guild_storage;
        _trade.noMail = item->flag.trade_restriction.mail;
        _trade.noAuction = item->flag.trade_restriction.auction;

//        _script = item->script;
//        _equipScript = item->equip_script;
//        _unEquipScript = item->unequip_script;
    }
    return self;
}

@end

@implementation RAItemFlags2

@end

@implementation RAItemDelay2

@end

@implementation RAItemStack2

@end

@implementation RAItemNoUse2

@end

@implementation RAItemTrade2

@end
