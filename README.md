# prok_distribution
猪肉配送问题
## 问题需求
公司在全省县级及以上城镇设立销售连锁店。全省县级及以上城镇地理位置及道路连接见数据文件：全省交通网络数据.xlsx
* 目前公司现有2个生产基地、23家销售连锁店，生产基地设在120号和63号城镇，为23家连锁店提供鲜猪肉，连锁店的日销售量见附录1。若运输成本为0.45元/吨公里，请你为公司设计生产与配送方案，使运输成本最低。
* 公司收集了近5年全省各城镇的鲜猪肉月度需求数据（文件：各城镇月度需求数据.txt）请你分析各城镇需求特征，并预测未来数年，何时全省鲜猪肉需求达到峰值，达到峰值时需求达到前5位和后5位的城镇是那些？
* 通过广告宣传等手段，未来几年公司在全省的市场占有率可增至3成左右（各城镇对公司产品每日需求预测数据见文件：公司未来各城镇每日需求预测数据.txt），调查还发现，公司产品的需求量与销售量并不完全一致，若在当地（同一城镇）购买，则这一部分需求量与销售量相同，若在不足10公里的其他城镇的销售连锁店购买，则这一部分需求量只能实现一半（成为公司产品销售量，由于距离的原因，另一半需求转向购买其他公司或个体工商户的产品），而在超过10公里的其他城镇的销售连锁店购买，销售量只能达到需求量的三成。于是，公司决定在各城镇增设销售连锁店，基于现有条件、成本等的考虑，原有的23家销售连锁店销售能力可在现有销售量的基础上上浮20%，增设的销售连锁店销售能力控制在每日20吨至40吨内，并且要求增设的销售连锁店的销售量必须达到销售能力的下限。同一城镇可设立多个销售连锁店。
请你为公司设计增设销售连锁店方案，使全省销售量达到最大。
* 在增设销售连锁店的基础上，公司决定增加生产基地，地址设立在城镇所在地，每日产品生产必须达到250吨以上，在生产与销售各环节不能有产品积压。
请你为公司设计生产基地增设方案，使运输成本最低。
* 公司产品若采用载重1.5吨的小货车从生产基地运往销售连锁店，小货车在高速公路上限速100公里/小时（高速公路见附录2），在普通公路上限速60公里/小时，销售连锁店需要的产品必须当日送达。假设：每日车辆使用时间不超过8小时，小货车装满或卸完1.5吨的货物均需要半小时，本市运输车辆行驶时间可忽略不计。
在公司增设销售连锁店、增加生产基地后，为完成每日运输任务，请你为公司确定小货车的最小需求量，及各车辆的调运方案。

## 附录数据
![image](https://github.com/Aplicity/prok_distribution/blob/master/images/appendix_data_01.png)

## 解决思路
把时间变量转换成以2008年1月为基期的自然数序列，即2008年1月=1，2008年2月=2，…。

全省的需求=所有城镇的需求之和

现在有时间索引序列(t=1,2,3….60)和全省的需求数据序列y，作ARIMA模型、预测未来的需求

或者直接做多项式拟合（拟合度R方为0.9621。），可以求出这个方程的最大值，大概在t=73附近得到最大值。换成原来的日期即为在2014年1月附近获得最大值。

另外，我们还需要知道在2014年月的时候，哪5个城镇的需求最大，哪5个城镇的需求最小。我们先求出每个城镇的月度平均值，挑选中平均值最大和最小的10个城镇。然后作时间序列分析，选用的模型为专家系统。预测出这20个城镇之后13个月的需求值。然后比较最后一个月的需求量，跳出需求最大的5个城镇和需求值最小的5个城镇。这20个城镇编号和在2014年1月中所对应的预测需求量如下表：
![image](https://github.com/Aplicity/prok_distribution/blob/master/images/result_image_01.png)

Note: 上表中，第一行中是需求最小的5个城镇，最后一行为需求量最大最大的5个城镇。

针对各个城镇的地理坐标，运用系统聚类对各个城镇进行聚类。在每个聚类cluster跳出cluster中需求最大的城镇，以这个城镇为计划分新增连锁店，计算其销量是否满足在20吨到40顿规定，如果不满足，则不宜作为新增连锁店。对满足日常需求的城镇，计算其需求。

针对每个聚类结果重复上面的计算，能得出每一个聚类结果所对应出的总体日常需求，然后挑选出需求最大的聚类结果即可。得出在城镇编号为68，31，101，150，121，104，100。

所有城镇每日的需求约为1180吨，而题目要求生产基地每日生成至少需要250吨，意味着最多建立4个生产基地。而考虑到运输成本问题，我们利用K-means聚类算法，根据地理坐标位置，把这些城镇分成4类，并判断每一类城镇的日常需求总量是否大于250吨。如果满足，则以每个类中心的城镇作为生产基地；若不满足，则降低聚类数，改成把城镇分成3类，再重复上述步骤。

通过计算，取定K=3，即把154个城镇分成三类，聚类中心为分别为
  （320.5278 ， 409.6019）
  （184.8362 ， 453.2500）
  （279.2143 ， 483.5833）

然后在聚类后的组别中挑取离聚类中心距离最小的城镇作为生产基地，这三个城镇分别为50,143,13编号的城镇。







