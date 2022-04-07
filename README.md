# โครงสร้างภาษา Solidity
## วิธีเขียนคำอธิบาย (Comment)
    -วิธีที่ 1 : ใช้ / ในการคอมเมนท์คำสั่งสั้นๆ
    -วิธีที่ 2 : ใช้ /*คำอธิบาย*/ 

## ตัวแปร 3 ประเภท (Variable)
1.State variable(attribute) : ตัวแปรถาวรใน smart Contract
2.Local variable : ตัวแปรที่ทำงานในฟังก์ชัน
3.Global variable : ตัวแปรที่ใ้ช้รับค่าข้อมูลเกี่ยวกับ Blockchain เช่น msg.sender เป็นต้น

## ชนิดข้อมูล (Type)
| Data type | Describe                 |
| --------- | ------------------------ |
| boolean   | ค่าทางตรรกศาสตร์           |
| integer   | Int(จำนวนเต็ม)             |
|           | uint(ตัวเลขที่มีเฉพาะเลขบวก) |
| String    | ข้อความ                   |
| struct    | โครงสร้างข้อมูล             |
| array     | ชุดข้อมูล                   |
| mapping   | <key, value>             |

### โครงสร้างการนิยามตัวแปร
```
type access_modifier name;
```
```solidity
bool status = false;
string public name = "Tiwat Lim"; 
//การกำหนด public ตัวแปรจะสามารถเข้าดูได้ และ ไม่เสียค่าแก๊ส
int amount = 0;
uint balance = 1000;
```
# Access Modifier
คือ รูปแบบการเข้าถึงข้อมูลหรือคุณสมบัติที่อยู่ใน smart contract
 1. public เป็นการประกาศระดับการเข้าถึงที่เข้มงวดน้อยที่สุดหรือกล่าวได้ว่าบุคคลภายนอกหรือใครๆก็สามารถเข้าถึงและเรียกใช้งานได้

 2. private เป็นการประกาศระดับการเข้าถึงที่เข้มงวดที่สุดกล่าวคือ จะมีแต่ Contract ของตัวมันเองเท่านั้นที่มีสิทธิ์ใช้งานได้

## โครงสร้างคำสั่ง
* [type, access_modifier, ชื่อตัวแปร;]
* [type, access_modifier, ชื่อตัวแปร = ค่าเริ่มต้น;]
## ตัวอย่าง
```solidity
 string public name;//public
 uint private _balance;//private
 ```
# Contructor
คือ ฟังก์ชั่นที่จะถูกเรียกใช้และทำงานอัตโนมัติเพียงครั้งเดียวในตอนเริ่มต้น รัน Smart Contract หรือทำการ Deploy

```solidity
 string name;
 uint _balance;//ไม่ระบุ public จะหมายถึง private
 constructor(string memory name, uint balance){
     _name = name;
     _balance = balance;
 }
 ```

# การกำหนดข้อบังคับ(require)
```
 require(เงื่อนไข,"ข้อความเตือนกลับ");
 ```
```solidity
// เช่น
 string name;
 uint _balance;//ไม่ระบุ public จะหมายถึง private
 constructor(string memory name, uint balance){
     require(balance>=500, "balance greater and equal 500");
     _name = name;
     _balance = balance;
 }
 ```
# ฟังก์ชั่น (Function)
เป็นกลุ่มคำสั่งหรือการแบ่งส่วนการทำงานที่อยู่ใน smart contract

```
โครงสร้าง:
function ชื่อฟังก์ชั่น(<parameter type>) {public|private} [pure|view|payable] [returns(<return types>)]
```

* Pure : เป็นการแจ้งว่าฟังก์ชั่นนี้ใช้งานกับค่าคงที่เท่านั้นไม่มีการยุ่งเกี่ยวกับการเปลี่ยนแปลงค่า storage
* View : เป็นการแจ้งว่าฟังก์ชั่นนี้มีการยุ่งเกี่ยวกับค่าใน storage หรือสามารถอ่านค่าจาก storage ได้เพียงอย่างเดียว
* Payable : เป็นการบ่งบอกว่าฟังก์ชั่นนี้มีการเรียกเก็บเงิน(Ether)ก่อนจะทำงานในฟังก์ชั่น 

```solidity
 function deposite(){
     //private function
 }

 function deposite() public{
     //public function
 }
 function deposite(uint amount) public{//parameter
    _balance+=amount;
 }
 function getBalance() public view returns(uint balance){
     return _balance;//ดึงค่า _balance จาก storage
 }
 function getBalance() public pure returns(uint balance){
     return 50; // ค่าคงที่
 }
 ```