// Generated by Apple Swift version 5.5.1 (swiftlang-1300.0.31.4 clang-1300.0.29.6)
#ifndef TERMINAL_SWIFT_H
#define TERMINAL_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="Terminal",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class UIColor;
@class NSString;
@class NSNumber;
@protocol UITextInputDelegate;
@class NSCoder;
@class UIInputViewController;
@class UIKeyCommand;

SWIFT_CLASS("_TtC8Terminal12TerminalView")
@interface TerminalView : UIView
@property (nonatomic, strong) IBInspectable UIColor * _Nullable terminalBackgroundColor;
@property (nonatomic, strong) IBInspectable UIColor * _Nullable terminalForegroundColor;
@property (nonatomic, strong) IBInspectable UIColor * _Nullable terminalCursorColor;
@property (nonatomic, copy) IBInspectable NSString * _Nullable terminalFontFamily;
@property (nonatomic) IBInspectable NSUInteger terminalFontSize;
@property (nonatomic) UIKeyboardType keyboardType;
@property (nonatomic) UIKeyboardAppearance keyboardAppearance;
@property (nonatomic) UIReturnKeyType returnKeyType;
@property (nonatomic, getter=isSecureTextEntry) BOOL secureTextEntry;
@property (nonatomic) UITextAutocorrectionType autocorrectionType;
@property (nonatomic) UITextAutocapitalizationType autocapitalizationType;
@property (nonatomic) UITextSpellCheckingType spellCheckingType;
@property (nonatomic) UITextSmartQuotesType smartQuotesType;
@property (nonatomic) UITextSmartDashesType smartDashesType;
@property (nonatomic) UITextSmartInsertDeleteType smartInsertDeleteType;
@property (nonatomic, weak) id <UITextInputDelegate> _Nullable inputDelegate;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
@property (nonatomic, readonly) BOOL canBecomeFirstResponder;
@property (nonatomic, readonly) BOOL canResignFirstResponder;
- (BOOL)becomeFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)resignFirstResponder SWIFT_WARN_UNUSED_RESULT;
- (BOOL)canPerformAction:(SEL _Nonnull)action withSender:(id _Nullable)sender SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) UIView * _Nullable inputAccessoryView;
@property (nonatomic, readonly, strong) UIInputViewController * _Nullable inputAccessoryViewController;
- (void)copy:(id _Nullable)sender;
- (void)paste:(id _Nullable)sender;
- (void)select:(id _Nullable)sender;
- (void)selectAll:(id _Nullable)sender;
- (void)increaseSize:(id _Nullable)sender;
- (void)decreaseSize:(id _Nullable)sender;
@property (nonatomic, readonly, copy) NSArray<UIKeyCommand *> * _Nullable keyCommands;
@end


@interface TerminalView (SWIFT_EXTENSION(Terminal)) <UIKeyInput>
@property (nonatomic, readonly) BOOL hasText;
- (void)insertText:(NSString * _Nonnull)text;
- (void)deleteBackward;
@end

@class UITextRange;
@protocol UITextInputTokenizer;
@class UITextPosition;
@class UITextSelectionRect;

@interface TerminalView (SWIFT_EXTENSION(Terminal)) <UITextInput>
- (NSString * _Nullable)textInRange:(UITextRange * _Nonnull)range SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) UITextRange * _Nullable markedTextRange;
@property (nonatomic, strong) UITextRange * _Nullable selectedTextRange;
- (void)setMarkedText:(NSString * _Nullable)markedText selectedRange:(NSRange)selectedRange;
- (void)unmarkText;
@property (nonatomic, readonly, strong) id <UITextInputTokenizer> _Nonnull tokenizer;
@property (nonatomic, copy) NSDictionary<NSAttributedStringKey, id> * _Nullable markedTextStyle;
- (void)replaceRange:(UITextRange * _Nonnull)range withText:(NSString * _Nonnull)text;
@property (nonatomic, readonly, strong) UITextPosition * _Nonnull beginningOfDocument;
@property (nonatomic, readonly, strong) UITextPosition * _Nonnull endOfDocument;
- (UITextRange * _Nullable)textRangeFromPosition:(UITextPosition * _Nonnull)fromPosition toPosition:(UITextPosition * _Nonnull)toPosition SWIFT_WARN_UNUSED_RESULT;
- (UITextPosition * _Nullable)positionFromPosition:(UITextPosition * _Nonnull)position offset:(NSInteger)offset SWIFT_WARN_UNUSED_RESULT;
- (UITextPosition * _Nullable)positionFromPosition:(UITextPosition * _Nonnull)position inDirection:(UITextLayoutDirection)direction offset:(NSInteger)offset SWIFT_WARN_UNUSED_RESULT;
- (NSComparisonResult)comparePosition:(UITextPosition * _Nonnull)position toPosition:(UITextPosition * _Nonnull)other SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)offsetFromPosition:(UITextPosition * _Nonnull)from toPosition:(UITextPosition * _Nonnull)toPosition SWIFT_WARN_UNUSED_RESULT;
- (UITextPosition * _Nullable)positionWithinRange:(UITextRange * _Nonnull)range farthestInDirection:(UITextLayoutDirection)direction SWIFT_WARN_UNUSED_RESULT;
- (UITextRange * _Nullable)characterRangeByExtendingPosition:(UITextPosition * _Nonnull)position inDirection:(UITextLayoutDirection)direction SWIFT_WARN_UNUSED_RESULT;
- (NSWritingDirection)baseWritingDirectionForPosition:(UITextPosition * _Nonnull)position inDirection:(UITextStorageDirection)direction SWIFT_WARN_UNUSED_RESULT;
- (void)setBaseWritingDirection:(NSWritingDirection)writingDirection forRange:(UITextRange * _Nonnull)range;
- (CGRect)firstRectForRange:(UITextRange * _Nonnull)range SWIFT_WARN_UNUSED_RESULT;
- (CGRect)caretRectForPosition:(UITextPosition * _Nonnull)position SWIFT_WARN_UNUSED_RESULT;
- (NSArray<UITextSelectionRect *> * _Nonnull)selectionRectsForRange:(UITextRange * _Nonnull)range SWIFT_WARN_UNUSED_RESULT;
- (UITextPosition * _Nullable)closestPositionToPoint:(CGPoint)point SWIFT_WARN_UNUSED_RESULT;
- (UITextPosition * _Nullable)closestPositionToPoint:(CGPoint)point withinRange:(UITextRange * _Nonnull)range SWIFT_WARN_UNUSED_RESULT;
- (UITextRange * _Nullable)characterRangeAtPoint:(CGPoint)point SWIFT_WARN_UNUSED_RESULT;
@end






#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif
