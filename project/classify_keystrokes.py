# bigram model
import sys
sys.path.append("/Users/allenchen/bin/scikit-learn")

import collections
import csv
import random
from sklearn import linear_model

PRUNE_THRESHOLD = 0
NUM_XVALIDATE_BUCKETS = 10
PERCENTAGE = 5
TARGET_USERNAME = "s026"

buckets = collections.defaultdict(list)

def logistic_regression(Xtr, ytr):
    m = linear_model.LogisticRegression()
    m.fit(Xtr, ytr)
    return m

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

# Make one training set
Xtr = []
ytr = []
for k,v in buckets.iteritems():
    if not k.startswith("s0"):
        continue
    for instance in v:
        if k == TARGET_USERNAME:
            Xtr += [instance[3:]]
            print instance[3:]
            ytr += [1]
        else:
            if random.randint(1,100) < PERCENTAGE:
                Xtr += [instance[3:]]
                ytr += [0]


prediction_model = logistic_regression(Xtr, ytr)


# predict with prediction_model.predict
