import data_io
from sklearn.linear_model import LogisticRegression
from sklearn import svm

X, y, X_submission = data_io.load()
X_train, X_test = X[:3000], X[3000:]
y_train, y_test = y[:3000], y[3000:]

clf_l1_LR = LogisticRegression(C=1e6, penalty='l1', tol=1e-6)
clf_l2_LR = LogisticRegression(C=1e6, penalty='l2', tol=1e-6)
clf_l1_LR.fit(X_train, y_train)
clf_l2_LR.fit(X_train, y_train)

clf_svm = svm.SVC(kernel='rbf', C=1).fit(X_train, y_train).fit(X_train, y_train)

print "L1_LR:"
print clf_l1_LR.score(X_test, y_test)

print "L2_LR:"
print clf_l2_LR.score(X_test, y_test)

print "SVM:"
print clf_svm.score(X_test, y_test)