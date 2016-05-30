#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#include <stdlib.h>

void setup_osx_menu() {
  id menubar = [[NSMenu new] autorelease];
  id appMenuItem = [[NSMenuItem new] autorelease];

  [menubar addItem:appMenuItem];
  [NSApp setMainMenu:menubar];

  id appMenu = [[NSMenu new] autorelease];
  id appName = [[NSProcessInfo processInfo] processName];
  id quitTitle = [@"Quit " stringByAppendingString:appName];
  id quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle
      action:@selector(terminate:) keyEquivalent:@"q"] autorelease];

  [appMenu addItem:quitMenuItem];
  [appMenuItem setSubmenu:appMenu];
}
