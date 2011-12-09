Mortiz is a small Frank helper app named after the cast of frankenstien characters.  It registers a URL handler and allows you to swap between your app and Mortiz to generate more lifecycle events.   It runs Frank on a different port, and adds a few ruby commands:

    mortiz_open_app
    frank_open_mortiz

I hope to soon add:

    mortiz_gobble_memory
    frank_open_mortiz_then_quit_after(10)


To get started, add this function to your app delegate:

    - (void)openURLString:(NSString *)urlString
    {
        NSURL *url = [NSURL URLWithString:urlString];
        BOOL can = [[UIApplication sharedApplication] canOpenURL:url];
        if (can)
            [[UIApplication sharedApplication] openURL:url];
    }


then copy ruby/mortiz_helper into features/support.  

TODO:
- libFrank.a is not armv[67]
- gem-ify