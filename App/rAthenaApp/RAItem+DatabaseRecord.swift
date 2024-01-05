//
//  RAItem+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaCommon
import rAthenaMap

extension RAItem: DatabaseRecord {
    var recordID: Int {
        itemID
    }

    var recordTitle: String {
        name
    }

    var recordFields: [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        fields += [
            .string("ID", "#\(itemID)"),
            .string("Aegis Name", aegisName),
            .string("Name", name),
        ]

        fields += [.string("Type", NSStringFromRAItemType(type))]
        switch type {
        case RA_IT_WEAPON:
            fields += [.string("Weapon Type", NSStringFromRAWeaponType(subType))]
        case RA_IT_AMMO:
            fields += [.string("Ammo Type", NSStringFromRAAmmoType(subType))]
        case RA_IT_CARD:
            fields += [.string("Card Type", NSStringFromRACardType(subType))]
        default:
            break
        }

        fields += [
            .string("Buy", "\(buy)z"),
            .string("Sell", "\(sell)z"),
        ]

        if type == RA_IT_WEAPON {
            fields += [
                .string("Attack", "\(attack)"),
                .string("Magic Attack", "\(magicAttack)"),
                .string("Attack Range", "\(range)"),
                .string("Weapon Level", "\(weaponLevel)"),
            ]
        }

        if type == RA_IT_ARMOR {
            fields += [
                .string("Defense", "\(defense)"),
                .string("Armor Level", "\(armorLevel)"),
            ]
        }

//        [fields ra_addFieldWithName:@"Slots" numberValue:@(self.slots)];
//
//        NSArray<RAJob *> *jobs = [[RAJobDatabase sharedDatabase] allRecords];
//        NSMutableArray<RADatabaseRecordField *> *jobFields = [NSMutableArray arrayWithCapacity:jobs.count];
//        for (RAJob *job in jobs) {
//            if ([self canBeEquippedByJob:job.jobID]) {
//                [jobFields ra_addFieldWithName:job.jobName referenceValue:job];
//            }
//        }
//        [fields ra_addFieldWithName:@"Jobs" arrayValue:jobFields];
//
//        [fields ra_addFieldWithName:@"Gender" stringValue:NSStringFromRASex(self.gender)];

        // TODO: Locations

//        [fields ra_addFieldWithName:@"Minimum Level" numberValue:@(self.equipLevelMin)];
//        [fields ra_addFieldWithName:@"Maximum Level" numberValue:@(self.equipLevelMax)];
//
//        [fields ra_addFieldWithName:@"Refinable" numberValue:@(self.refineable)];
//        [fields ra_addFieldWithName:@"Gradable" numberValue:@(self.gradable)];

        // TODO: View

        // TODO: Alias Name

        return fields
    }

    /// @discussion See function @c pc_job_can_use_item in pc.cpp
    /// @discussion See function @c pc_isItemClass in pc.cpp
//    - (BOOL)canBeEquippedByJob:(NSInteger)jobID {
//        uint64 clazz = pc_jobid2mapid(jobID);
//
//        // Calculate the required bit to check
//        uint64 job = 1ULL << ( clazz & MAPID_BASEMASK );
//
//        size_t index;
//
//        // 2-1
//        if( ( clazz & JOBL_2_1 ) != 0 ){
//            index = 1;
//        // 2-2
//        }else if( ( clazz & JOBL_2_2 ) != 0 ){
//            index = 2;
//        // Basejob
//        }else{
//            index = 0;
//        }
//
//        if (( self.jobs[index].unsignedIntegerValue & job ) == 0) {
//            return NO;
//        }
//
//        if (self.classes&ITEMJ_NORMAL && !(clazz&(JOBL_UPPER|JOBL_BABY|JOBL_THIRD|JOBL_FOURTH)))    //normal classes (no upper, no baby, no third, no fourth)
//            return YES;
//    #ifndef RENEWAL
//        //allow third classes to use trans. class items
//        if (self.classes&ITEMJ_UPPER && clazz&(JOBL_UPPER|JOBL_THIRD))    //trans. classes
//            return YES;
//        //third-baby classes can use same item too
//        if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY)    //baby classes
//            return YES;
//        //don't need to decide specific rules for third-classes?
//        //items for third classes can be used for all third classes
//        if (self.classes&(ITEMJ_THIRD|ITEMJ_THIRD_UPPER|ITEMJ_THIRD_BABY) && clazz&JOBL_THIRD)
//            return YES;
//    #else
//        //trans. classes (exl. third-trans.)
//        if (self.classes&ITEMJ_UPPER && clazz&JOBL_UPPER && !(clazz&JOBL_THIRD))
//            return YES;
//        //baby classes (exl. third-baby)
//        if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY && !(clazz&JOBL_THIRD))
//            return YES;
//        //third classes (exl. third-trans. and baby-third and fourth)
//        if (self.classes&ITEMJ_THIRD && clazz&JOBL_THIRD && !(clazz&(JOBL_UPPER|JOBL_BABY)) && !(clazz&JOBL_FOURTH))
//            return YES;
//        //trans-third classes (exl. fourth)
//        if (self.classes&ITEMJ_THIRD_UPPER && clazz&JOBL_THIRD && clazz&JOBL_UPPER && !(clazz&JOBL_FOURTH))
//            return YES;
//        //third-baby classes (exl. fourth)
//        if (self.classes&ITEMJ_THIRD_BABY && clazz&JOBL_THIRD && clazz&JOBL_BABY && !(clazz&JOBL_FOURTH))
//            return YES;
//        //fourth classes
//        if (self.classes&ITEMJ_FOURTH && clazz&JOBL_FOURTH)
//            return YES;
//    #endif
//
//        return NO;
//    }
}
