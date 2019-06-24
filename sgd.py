# -*- coding: utf-8 -*-
"""
Created on Fri Mar 29 12:47:43 2019

@author: gsaikia
"""
from sklearn.datasets import load_breast_cancer
X,y = load_breast_cancer(return_X_y=True)

from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_scaled = sc.fit_transform(X)

from sklearn.model_selection import train_test_split
X_train, X_test,y_train,y_test = train_test_split(X_scaled,y,random_state=0)


from sklearn.linear_model import SGDClassifier
model = SGDClassifier(loss='log',learning_rate='constant', eta0=0.01,penalty='l2',alpha=1)
model.fit(X_train,y_train)
model.score(X_test,y_test)