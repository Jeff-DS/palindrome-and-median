// Return YES if the second string is a permutation of the first and is a palindrome
-(BOOL)isPermPalindrome:(NSString *)original ofString:(NSString *)modified {
    
    BOOL isPermutation;
    
    // Check if the strings are permutations of each other: split strings into arrays, sort, convert back to strings, compare
    
    NSMutableArray *origArr = [self split:original];
    NSMutableArray *modArr = [self split:modified];
    
    [origArr sortUsingSelector:@selector(caseInsensitiveCompare:)];
    [modArr sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSString *origSorted = [origArr componentsJoinedByString:@""];
    NSString *modSorted = [modArr componentsJoinedByString:@""];
    
    isPermutation = [origSorted isEqualToString:modSorted];
    
    if (!isPermutation) {
        return NO;
    }
    
    // Check if second string is a palindrome: start at the middle and compare moving outwards
    
    NSUInteger pivot = (modified.length / 2);   // if length is odd, rounds down to integer
    
    // even
    if (modified.length % 2 == 0) {
        for (int i = 0; i <= pivot; i++) {
            if ([modified characterAtIndex:pivot + i] != [modified characterAtIndex:pivot - (i + 1)]) {
                return NO;
            }
        }
        
    } else
        
    { // odd
        for (int i = 0; i <= pivot; i++) {
            if ([modified characterAtIndex:pivot + i] != [modified characterAtIndex:pivot - i]) {
                return NO;
            }
        }
        
    }
    return YES;
}

// Split string into array of one-character strings
-(NSMutableArray *)split:(NSString *)string {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < string.length; i++) {
        NSString *charString = [NSString stringWithFormat:@"%hu", [string characterAtIndex:i]];
        [array addObject:charString];
    }
    
    return array;
}