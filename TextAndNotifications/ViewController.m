#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textview;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [self changeFont];
    
    [center addObserver:self
               selector:@selector(changeNotification:)
                   name:UIContentSizeCategoryDidChangeNotification
                 object:nil];
}
- (void)changeNotification:(NSNotification *)notification {
    [self changeFont];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center removeObserver:self
                      name:UIContentSizeCategoryDidChangeNotification
                    object:nil];
}

- (void)changeFont {
    self.textview.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}



- (IBAction)buttonClick:(id)sender {
    NSRange selected = [self.textview selectedRange];
    
    [self.textview.textStorage addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range: selected];
}
@end
