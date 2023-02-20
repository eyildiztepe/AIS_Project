library(dplyr)
library(lubridate)
library(readxl)
library(chron)

#Veri Okuma

data<-read.csv("data/AIS_2020_01_01.csv")
data<-data %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data1<-read.csv("data/AIS_2020_01_02.csv")
data1<-data1 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data2<-read.csv("data/AIS_2020_01_03.csv")
data2<-data2 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data3<-read.csv("data/AIS_2020_01_04.csv")
data3<-data3 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data4<-read.csv("data/AIS_2020_01_05.csv")
data4<-data4 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data5<-read.csv("data/AIS_2020_01_06.csv")
data5<-data5 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data6<-read.csv("data/AIS_2020_01_07.csv")
data6<-data6 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data7<-read.csv("data/AIS_2020_01_08.csv")
data7<-data7 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data8<-read.csv("data/AIS_2020_01_09.csv")
data8<-data8 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data9<-read.csv("data/AIS_2020_01_10.csv")
data9<-data9 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data10<-read.csv("data/AIS_2020_01_11.csv")
data10<-data10 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data11<-read.csv("data/AIS_2020_01_12.csv")
data11<-data11 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data12<-read.csv("data/AIS_2020_01_13.csv")
data12<-data12 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data13<-read.csv("data/AIS_2020_01_14.csv")
data13<-data13 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()
data14<-read.csv("data/AIS_2020_01_15.csv")
data14<-data14 %>%
  filter(VesselType>=70 & VesselType<=89) %>%
  select_all()

#bir haftalık veri
DATA<-rbind(data,data1,data2,data3,data4,data5,data6)

#iki haftalık veri
TanKaD<-rbind(DATA,data7,data8,data9,data10,data11,data12,data13,data14)

#Verilerin zamana göre sıralanması
TanKaD$BaseDateTime<-ymd_hms(TanKaD$BaseDateTime)
TanKaD$Date<-substring(TanKaD$BaseDateTime,1,10)#Sadece tarih yazılı bir sütun oluşturuldu.
TanKaD$Time<-substring(TanKaD$BaseDateTime,12,19)#Sadece saat yazılı bir sütun oluşturuldu
TanKaD$Time <- chron(times=TanKaD$Time)
TanKaD$Date<-as.Date(TanKaD$Date)
TanKaD$BaseDateTime<-ymd_hms(TanKaD$BaseDateTime)

summary(TanKaD)#özet istatistikler
str(TanKaD)#degiskenlerin birimleri kontrol edildi.

#COG Düzeltmesi
TanKaD$NewCOG<-ifelse(TanKaD$COG<=0,TanKaD$COG+360,TanKaD$COG)
