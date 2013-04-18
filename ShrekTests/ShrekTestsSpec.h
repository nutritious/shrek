
#import "Kiwi.h"
#import "Nocilla.h"

#define USE_NOCILLA \
beforeAll(^{ \
[[LSNocilla sharedInstance] start]; \
\
}); \
\
afterAll(^{ \
[[LSNocilla sharedInstance] stop]; \
}); \
\
afterEach(^{ \
[[LSNocilla sharedInstance] clearStubs]; \
});