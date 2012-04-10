# bigram model

import collections
import csv
import random

PRUNE_THRESHOLD = 10
NUM_XVALIDATE_BUCKETS = 10

buckets = collections.defaultdict(list)

def classify(model, data):
    pass
    
def prepare(buckets, file):
    runs = csv.reader(open(file, "r"))
    full_set = collections.defaultdict(list)

    for r in runs:
        # prune away the first N results
        if r[2] > PRUNE_THRESHOLD:
            full_set[r[0]] += [r]
    
    # Set up test and train sets
    for k, v in full_set.iteritems():
        random.shuffle(v)
        v_length = len(v)
        for i in range(NUM_XVALIDATE_BUCKETS):
            v_start = int(v_length * (1/float(NUM_XVALIDATE_BUCKETS)) * i)
            v_end = int(v_length * (1/float(NUM_XVALIDATE_BUCKETS)) * (i+1))
            new_bucket = v[v_start:v_end]
            buckets[k] += new_bucket


prepare(buckets, "keystrokes.csv")

for i in buckets["s002"]:
    print len(i)
