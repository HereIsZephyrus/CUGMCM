import numpy as np
import matplotlib.pyplot as plt
#创造数据
x = [-2,6,-2,7,-3,3,0,8,1,10,2,12,2,5,3,6,4,5,2,15,1,10,4,7,4,11,0,3,-1,4,1,5,3,11,4,6]
x = np.mat(x).reshape(-1,2)
y = [1,1,-1,1,1,1,-1,-1,-1,1,1,-1,1,-1,-1,-1,1,1]
y = np.mat(y).reshape(-1,1)
datamat = x
labelmat = y
#求a2的范围
def setrange(a1,a2,y1,y2,C):
    if (y1 != y2):
        ##print('y1!=y2')
        L = max(0,a2 - a1)
        H = min(C,C + a2 - a1)
    else:
        L = max(0, a2 + a1 - C)
        H = min(C, a2 + a1)
    #print('L:',L)
    #print('H:',H)
    return L,H

#在定义域选择最小值
def choosemin(L,H,a2):
    #print('a2导数等于0：a2:',a2)
    if a2 > H:
       #print('a选择的值为:',H)
        return H
    if a2 < L:
        #print('a选择的值为:',L)
        return L
    else:
        #print('a选择的值为:',a2)
        return a2

#根据公式和定义域算newa2
def getnewa2(Ex,index1,index2,a,labelmat,datamat,C):
    K11 = K(datamat,index1,index1)
    K22 = K(datamat,index2,index2)
    K12 = K(datamat,index1,index2)
    E1 = Ex[index1,0]
    E2 = Ex[index2,0]
    a1 = a[index1,0]
    a2 = a[index2,0]
    y1 = labelmat[index1,0]
    y2 = labelmat[index2,0]
    L,H = setrange(a1,a2,y1,y2,C)
    if K11 + K22 - 2*K12==0:
        print('gfhhhfgggggggggg函数里的除0错误index:',index1,index2)
    newa2 = a2 + (y2 * (E1 - E2)) / (K11 + K22 - 2*K12)               #根据偏导求出最小值a2
    newa2 = choosemin(L,H,newa2)                                        #让a2满足定义域中取值
    return newa2

#检验是否目标函数在下降                    L = L + ...   需要要求...<0
def ifdown(a,index1,index2,newa1,newa2,datamat):              #   L = L + x   要想L下降，则x<0    下降则返回flag = 1
    flag = 0
    a1 = a[index1,0]
    a2 = a[index2,0]
    x = a1 - newa1 + a2 - newa2 + 0.5 * ((newa1**2 - a1**2) * K(datamat,index1,index1)+ 2*labelmat[index1,0] * labelmat[index2,0] * K(datamat,index1,index2)*(newa1*newa2-a1*a2) + (newa2**2 - a2**2)*K(datamat,index2,index2))
    # print('x是否小于0:',x)
    if x < 0:
        flag = 1
    return flag

#K11 = x1 * x1.T
def K(datamat,index1,index2):
    return datamat[index1,:] * datamat[index2,:].T

#主函数SVM
def mySVM(datamat,labelmat,C,times):
    m, n = np.shape(datamat)
    a = np.zeros((m,1))
    b = 0  # wx+b 那个b
    gx = np.zeros((m, 1))  # 原公式g(x) = wx + b    有m行数据就有m行给g(x)
    w = np.zeros((1,2))  # wx+b 的 w ，例：w = （0，0） 二维
    Ex = gx - labelmat
    #训练次数大循环
    for i in range(times):
        flag = 0                #用于选取第一个α时是否不满足第一个条件
        flagdown = 0
        index1 = 0                    #选取α1的序号
        for a1 in a:             #取第一个α
            E1 = Ex[index1]
            a1 = a1[0]              #a1原来是[5]的格式,取第0个取出其数值5
            distence1 = labelmat[index1,0] * gx[index1,0]           # y*g(x)
            index2 = 0
            if 0 < a1 < C and distence1 != 1:                   #优先选择支持向量违反kkt条件
                # print('第一条件a1', index1)
                flag = 1                                         #是否经过第一层支持向量的检验
                listEx = list(Ex)
                del (listEx[index1])                             #listEx为去除了index1的数据的Ex 方便a2的筛选
                for a2 in a:
                    # print()
                    if index1 == index2:
                        index2 += 1
                        continue
                    #print('第一条件内循环a2：index1:{},index2:{}'.format(index1,index2))
                    Ex2 = Ex[index2]
                    minEx = min(listEx)
                    maxEx = max(listEx)
                    # 满足条件则继续往下 不满足则continue
                    if E1 <= 0 and Ex2 == maxEx:
                        # print('a2满足第一条')
                        index2 = index2
                    elif E1 > 0 and Ex2 == minEx:
                        # print('a2满足第二条')
                        index2 = index2
                        # 防止除0错误
                    else:
                        # print('都不满足继续循环找a2')
                        index2 += 1
                        continue
                    k = labelmat[index1,0] * a1 + labelmat[index2,0] * a2           # 即y1a1 + y2a2 = k       为后面求newa1做铺垫
                    if K(datamat, index1, index1) + K(datamat, index2, index2) - 2 * K(datamat, index1, index2) == 0:
                        # print('第一种除0错误', index1, index2)
                        index2 += 1
                        continue
                    newa2 = getnewa2(Ex,index1,index2,a,labelmat,datamat,C)
                    newa1 = labelmat[index1,0] * k - labelmat[index1,0] * labelmat[index2,0] * newa2    #即a1 = y1k - y1y2a2
                    flagdown = ifdown(a,index1,index2,newa1,newa2,datamat)
                    if flagdown == 1:                               #如果下降，改变原来的a集合中的对应两个a1 a2
                        print('第一种外循环的下降')
                        print('newa1:{},newa2:{},index1:{},index2:{}'.format(newa1, newa2, index1, index2))
                        a[index1] = newa1
                        a[index2] = newa2
                        w = np.multiply(a, labelmat).T * datamat
                        if newa1 < C and newa1 > 0:
                            if newa2 < C and newa2 > 0:
                                b = (labelmat[index1] - w * datamat[index1,:].T) + (labelmat[index2] - w * datamat[index2,:].T)
                                b = 0.5 * b      #两个都是支持向量就取平均值
                            else:
                                b = (labelmat[index1] - w * datamat[index1,:].T)
                        else:
                            if newa2 < C and newa2 > 0:
                                b = labelmat[index2] - w * datamat[index2,:].T
                            else:
                                b = b
                        gx[index1] = w * datamat[index1, :].T + b
                        gx[index2] = w * datamat[index2, :].T + b
                        Ex[index1] = gx[index1] - labelmat[index1]
                        Ex[index2] = gx[index2] - labelmat[index2]
                        break
                    else:
                        del (listEx[listEx.index(Ex2)])
                    index2 += 1
            if flagdown == 1:                                       #下降成功，a1循环也停止，重新开始选两个a1进行
                break
            index1 +=1
        #a1的第二种选取条件
        if flag == 0:
            index1 = 0  # 上面改变了 在这里重新初始化
            for a1 in a:  # 取第一个α
                index2 = 0
                E1 = Ex[index1]
                a1 = a1[0]  # a1原来是[5]的格式,取第0个取出其数值5
                distence1 = labelmat[index1, 0] * gx[index1, 0]  # y*g(x)
                # print('第二条件外循环a1，index1:{},distence:{}'.format(index1,distence1))
                if (a1==0 and distence1 <= 1) or (a1==C and distence1 >=1):  # 优先选择支持向量违反kkt条件
                    flagdown = 0
                    listEx = list(Ex)
                    del (listEx[index1])  # listEx为去除了index1的数据的Ex 方便a2的筛选
                    for a2 in a:
                        # print()
                        if index1 == index2:
                            index2 += 1
                            continue
                        # print('第二条件内循环a2：index1:{},index2:{}'.format(index1, index2))
                        Ex2 = Ex[index2]
                        minEx = min(listEx)
                        maxEx = max(listEx)
                        # print('Ex2:{},minEx:{},maxEx:{}'.format(Ex2,minEx,maxEx))
                        # 满足条件则继续往下 不满足则continue
                        if E1 <= 0 and Ex2 == maxEx:
                            # print('a2满足第一条')
                            index2 = index2
                        elif E1 > 0 and Ex2 == minEx:
                            # print('a2满足第二条')
                            index2 = index2
                            # 防止除0错误
                        else:
                            # print('都不满足继续循环找a2')
                            index2 += 1
                            continue
                        k = labelmat[index1, 0] * a1 + labelmat[index2, 0] * a2  # 即y1a1 + y2a2 = k       为后面求newa1做铺垫
                        if K(datamat, index1, index1) + K(datamat, index2, index2) - 2 * K(datamat, index1,
                                                                                           index2) == 0:
                            # print('第一种除0错误', index1, index2)
                            index2 += 1
                            continue
                        newa2 = getnewa2(Ex, index1, index2, a, labelmat, datamat, C)
                        newa1 = labelmat[index1, 0] * k - labelmat[index1, 0] * labelmat[
                            index2, 0] * newa2  # 即a1 = y1k - y1y2a2
                        flagdown = ifdown(a, index1, index2, newa1, newa2, datamat)
                        if flagdown == 1:  # 如果下降，改变原来的a集合中的对应两个a1 a2
                            print('第二种外循环的下降')
                            print('newa1:{},newa2:{},index1:{},index2:{}'.format(newa1,newa2,index1,index2))
                            a[index1] = newa1
                            a[index2] = newa2
                            w = np.multiply(a, labelmat).T * datamat
                            if newa1 < C and newa1 > 0:
                                if newa2 < C and newa2 > 0:
                                    b = (labelmat[index1] - w * datamat[index1, :].T) + (
                                                labelmat[index2] - w * datamat[index2, :].T)
                                    b = 0.5 * b  # 两个都是支持向量就取平均值
                                else:
                                    b = (labelmat[index1] - w * datamat[index1, :].T)
                            else:
                                if newa2 < C and newa2 > 0:
                                    b = labelmat[index2] - w * datamat[index2, :].T
                                else:
                                    b = b
                            gx[index1] = w * datamat[index1, :].T + b
                            gx[index2] = w * datamat[index2, :].T + b
                            Ex[index1] = gx[index1] - labelmat[index1]
                            Ex[index2] = gx[index2] - labelmat[index2]
                            break
                        else:
                            del(listEx[listEx.index(Ex2)])
                        index2 += 1
                if flagdown == 1:  # 下降成功，a1循环也停止，重新开始选两个a1进行
                    break
                index1 += 1
    return w,b,a
print()
myW,myB,myA= mySVM(datamat,labelmat,0.0229,50)
print('W',myW)
print('B:',myB)
print('a.T',myA.T)

# 画图 展示数据
fig = plt.figure()
ax2 = fig.add_subplot(121)
ax2.scatter(list(datamat[:,0]),list(datamat[:,1]),list(10*(labelmat+2)),list(10*(labelmat+2)))
x = np.linspace(-3,5,50)
y = (-myB - myW[0,0] * x) / myW[0,1]
plt.plot(x,y.T,'r-')
plt.plot(x,y.T+1/myW[0,1],'b--')
plt.plot(x,y.T-1/myW[0,1],'y--')
plt.show()