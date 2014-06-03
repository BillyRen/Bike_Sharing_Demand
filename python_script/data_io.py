import numpy as np


def read_data(file_name):
    f = open(file_name)

    # ignore header
    f.readline()
    samples = []

    for line in f:
        line = line.strip().split(",")
        # sample = [float(x) for x in line]
        # TODO: Fix the datetime bug
        sample = [float(x) for x in line[1:]]
        samples.append(sample)

    return samples


def load():
    # Load all data as numpy arrays.
    print "Loading data..."

    filename_train = '../data/train_one_hot.csv'
    filename_test = '../data/test_one_hot.csv'

    train = read_data(filename_train)
    y_train = np.array([x[-1] for x in train])
    X_train = np.array([x[:-1] for x in train])

    X_test = np.array(read_data(filename_test))

    return X_train, y_train, X_test


if __name__ == '__main__':
    X_train, y_train, X_test = load()