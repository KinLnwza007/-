# ⚔️ Vanguard Hub — Cardfight!! Vanguard Deck Builder & Simulator

เว็บแอปพลิเคชันระบบจัดเด็ค ฐานข้อมูลการ์ด และโต๊ะจำลองเล่น (Table Simulator) สำหรับ **Cardfight!! Vanguard** พัฒนาด้วยแรงบันดาลใจจากสไตล์และฟังก์ชันของ **BotTCG (Battle of Talingchan)** พร้อมระบบแชร์รหัสเด็ค (Deck Code) เช่น `7u6qTjDeVBwr`

---

## 🌟 ฟังก์ชันหลัก (Key Features)

### 1. 🎴 ระบบดูเด็ค & แชร์รหัส (Deck Viewer & Code Sharing)
- รองรับการเปิดเด็คด้วยรหัส เช่น **`7u6qTjDeVBwr`** (เด็ค Dragonic Overlord the End)
- ปุ่ม **"คัดลอกรหัส"** แบบ 1-Click
- แสดงรายละเอียดเด็คแยกเป็น:
  - **ไรด์เด็ค (Ride Deck):** 4 ใบ (Grade 0, Grade 1, Grade 2, Grade 3) พร้อมเอฟเฟกต์สีทอง
  - **เมนเด็ค (Main Deck):** 50 ใบ แบ่งหมวดหมู่ Grade 3+, Grade 2, Grade 1, Triggers, Orders พร้อมตัวนับจำนวน x4, x3
- แถบสถิติเด็ค (Deck Statistics):
  - สัดส่วนเกรด (Grade Curve)
  - สัดส่วนทริกเกอร์ 16 ใบ (Critical, Draw, Front, Heal, Over Trigger)
  - ค่าพลังป้องกัน (Shield Value Breakdown)
  - ตัวนับความถูกต้องตามกติกา Standard (Legal Check)

### 2. 🛠️ ระบบจัดเด็ค (Interactive Deck Builder)
- เลือกรองรับทุกเนชั่นหลัก: Dragon Empire, Keter Sanctuary, Brandt Gate, Dark States, Stoicheia, Lyrical Monasterio
- ตรวจสอบกติกาแบบ Real-time:
  - เมนเด็คต้องครบ 50 ใบพอดี
  - ไรด์เด็คครบ 4 ใบ (G0 - G3)
  - ทริกเกอร์รวม 16 ใบ (Heal ไม่เกิน 4, Over ไม่เกิน 1)
  - การ์ดชื่อเดียวกันไม่เกิน 4 ใบ
  - เซนทิเนลไม่เกิน 4 ใบ, เรกาลิส พีซไม่เกิน 1 ใบ
- ปุ่มสุ่มสร้างรหัสเด็คใหม่ 12 หลัก
- บันทึกเด็กลง LocalStorage ของเบราว์เซอร์

### 3. 🎮 โต๊ะจำลองเล่น & ทดลองจั่ว (Table Simulator & Solitaire)
- **เพลย์แมตสนาม Vanguard จำลอง:**
  - Vanguard Circle (VC) พร้อมตัวนับโซล (Soul)
  - Rear-guard Circles (RC) 5 ช่อง (หน้าซ้าย, หน้าขวา, หลังซ้าย, หลังกลาง, หลังขวา)
  - Damage Zone (แดเมจ 0 - 6) พร้อมระบบคลิกเพื่อทำ Counter Blast (CB) หรือ Counter Charge (CC)
  - Trigger Zone สำหรับแสดงการ์ดที่เช็คได้
  - กองเด็ค (Deck Pile), สุสาน (Drop Zone)
- **ระบบคำสั่งในเกม:**
  - ช่วงมัลลิแกน (Mulligan): เลือกการ์ดบนมือสับคืนใต้กองแล้วจั่วใหม่
  - จั่วการ์ด (Draw Phase)
  - ไรด์การ์ดอัตโนมัติจาก Ride Deck (Ride Phase)
  - ไดรฟ์เช็ค (Drive Check): สุ่มเช็คการ์ดบนสุด หากเป็นทริกเกอร์จะมีแอนิเมชันเอฟเฟกต์พิเศษแจ้งเตือน
  - เช็คแดเมจ (Damage Check)
  - สแตนด์ทั้งหมด (Stand All)

### 4. 🖼️ ส่งออกรูปเด็คลิสต์ (Export Decklist Image)
- ส่งออกภาพเด็คลิสต์ความละเอียดสูงเป็นไฟล์ PNG หรือคัดลอกลงคลิปบอร์ด
- ส่งออกข้อความ Text DeckLog สำหรับลงแข่ง

### 5. 🔍 ฐานข้อมูลการ์ดแปลไทย (Card Database)
- รวมการ์ดแวนการ์ดยอดนิยมพร้อมคำอธิบายสกิลภาษาไทยและอังกฤษ
- ค้นหาตามชื่อ, รหัส, สกิล, เนชั่น, เกรด, หรือประเภททริกเกอร์

---

## 🚀 วิธีเปิดใช้งาน (How to Run)

### วิธีที่ 1: ดับเบิลคลิกไฟล์ Batch
ดับเบิลคลิกที่ไฟล์ **`start-server.bat`** ในโฟลเดอร์นี้ ระบบจะเริ่มเซิร์ฟเวอร์และเปิดเบราว์เซอร์ให้อัตโนมัติ

### วิธีที่ 2: รันผ่าน Terminal
```bash
npm run dev
```
เปิดเบราว์เซอร์ไปที่: `http://localhost:5173/?deck=7u6qTjDeVBwr`
