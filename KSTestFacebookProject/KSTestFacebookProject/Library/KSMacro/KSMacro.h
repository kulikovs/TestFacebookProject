//
//  KSPrintOutputType.h
//  KSMacrosPrintOutputType
//
//  Created by KulikovS on 25.12.15.
//  Copyright © 2015 KulikovS. All rights reserved.
//


#ifndef KSOutputType_h
#define KSOutputType_h

//Objective C

#define KSWeakifySelfWithClass(classObject) \
    __weak classObject *weakSelf = self

#define KSStrongifySelfWithClass(classObject) \
    __strong classObject *strongSelf = weakSelf; \
        if (!strongSelf) { \
            return; \
    }



#define KSWeakifySelf \
    __weak id weakSelf = self

#define KSStrongifySelfAndReturnIfNil \
    __strong id strongSelf = weakSelf; \
        if (!strongSelf) { \
            return; \
    }

#define KSRootViewAndReturnNilMacro(theClass) \
    - (theClass *)rootView { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[theClass class]]) { \
            return (theClass *)self.view; \
            } \
        return nil; \
    }


#endif /* KSOutputType_h */
