# Robot Framework - Stage 1-0 : เตรียมความพร้อม

## ติดตั้ง Python 3 และ Pip

### Windows (ผ่าน chocolatey)

```
choco install python3
```

เสร็จแล้วก็เพิ่ม ```C:\Python36\;C:\Python36\Scripts\``` ลงใน PATH environment ด้วย

ใครสะดวกใช้ Powershell ก็สั่งคำสั่งนี้ก็ได้ ให้ผลเหมือนกัน

```
[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python36\;C:\Python36\Scripts\", "User")
```

### OSX (ผ่าน homebrew)

```
brew install python3
```

### Ubuntu

```
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install python3-pip
```

## วิธีตรวจสอบว่าลง Python 3 แล้ว

เปิด Terminal แล้วรันคำสั่ง ```python3 -V``` มันควรจะตอบอะไรประมาณนี้กลับมา

```
Python 3.6.2
```

## วิธีตรวจสอบว่าลง Pip แล้ว

ทำคล้ายกับตอนเช็ค Python คือ เปิด Terminal แล้วรันคำสั่ง ```pip3 -V``` มันควรจะตอบอะไรประมาณนี้กลับมา

```
pip 9.0.1 from /usr/local/lib/python3.6/site-packages (python 3.6)
```

### มันบอกว่า หาคำสั่ง python3 ไม่เจอ

1. ใช้ Windows ใช่ไหม
    * Set PATH หรือยัง ถ้ายัง ไป Set PATH ให้เรียบร้อย
    * Restart Terminal หรือยัง ถ้ายัง Restart Terminal ทีนึงนะ การเปลี่ยนแปลงค่า Environment ใน Windows มันต้อง Restart Terminal มันถึงจะเห็นการเปลี่ยนแปลง
    * ลองเปลี่ยนเป็นคำสั่ง ```python -V``` ดูว่าได้ไหม

### มันขึ้นเป็น python อื่นที่ไม่ได้ install

1. ใช้ Windows ใช่ไหม
    * ลองดูว่าเมื่อกี๊ใช้คำสั่ง ```python3 -V``` หรือ ```python -V```
    * ลองดูว่า PATH ที่ตั้งไว้ มันชี้ไปที่ไหน ชี้ไปคนละที่กับ version ที่เราเพิ่งติดตั้งหรือเปล่า
2. ใช้ OS อื่น ๆ
    * ลองดูว่าเมื่อกี๊ใช้คำสั่ง ```python3 -V``` หรือ ```python -V```
    * ลองดูว่าคำสั่งที่เราเรียก เป็น Symbolic Link ใช่หรือไม่ ถ้าใช่ มันชี้ไปที่ไหน เป็นที่เดียวกับ version ที่เราเพิ่งติดตั้งหรือเปล่า

### มันบอกว่าหาคำสั่ง pip3 ไม่เจอ
1. ใช้ Windows ใช่ไหม
    * ตอนติดตั้งผ่าน GUI ได้เลือกให้ติดตั้ง pip ด้วยหรือเปล่า ถ้าไม่ กลับไปติดตั้งใหม่ แล้วเลือกติดตั้ง pip ด้วย
    * Set PATH หรือยัง ถ้ายัง ไป Set PATH ให้เรียบร้อย
    * Restart Terminal หรือยัง ถ้ายัง Restart Terminal ทีนึงนะ การเปลี่ยนแปลงค่า Environment ใน Windows มันต้อง Restart Terminal มันถึงจะเห็นการเปลี่ยนแปลง
    * ลองเปลี่ยนเป็นคำสั่ง ```python -V``` ดูว่าได้ไหม

## ติดตั้ง Dependencies สำหรับ Robot Framework

รันคำสั่งข้างล่าง เพื่อติดตั้ง Dependencies ที่ต้องใช้ทั้งหมด

```
pip3 install --pre --upgrade -r packages.txt
```

### มันบอกว่าหาไฟล์ชื่อ packages.txt ไม่เจอ?

ดาวน์โหลดไฟล์ packages.txt ที่อยู่ใน repository นี้ไปใช้เลย ในนั้นใส่รายชื่อ dependencies ไว้ให้หมดแล้ว

ดาวน์โหลดเสร็จแล้ว กลับไปติดตั้ง dependencies ใหม่ตามคำสั่งด้านบน

## ลอง

ลองรันคำสั่ง ```pybot welcome.robot``` ดู มันควรจะผ่าน

## ยังไงต่อ

ไป Stage ถัดไปสิจ๊ะ จะรออะไร