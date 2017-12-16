'''
Topic   :: utility belt
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''

'''
Class :: Counter
'''

class Counter(dict):
    ''' extends dictionary to bypass key initialization '''
    ''' freezes self for possible use as dictionary key '''

    def __getitem__(self, idx):
        self.setdefault(idx, 0)
        return dict.__getitem__(self, idx)

    def freeze(self):
        return frozenset(self.items())


'''
Helper Functions
'''
    
def p_norm(array, offset = 10.0):
    ''' normalize q values for weighted random sampling '''

    array = [offset + item - min(array) for item in array]
    array = [float(item)/sum(array) for item in array]

    return array
