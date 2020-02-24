clear all
close all
clc


A=load('Si.csv');

wl=A(:,1);
n=A(:,2);
k=A(:,3);

figure
hold on;grid on;

plot(wl,n,'b')
plot(wl,k,'g')