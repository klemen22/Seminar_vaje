@ECHO OFF
CHCP 65001

ECHO.
ECHO  ----------------------------
ECHO     Ustvarjam package.json
ECHO  ----------------------------
ECHO. 
npm init &&(

ECHO.
ECHO  ----------------------
ECHO     Nameščam Express
ECHO  ----------------------
ECHO.
npm install express &&(

ECHO.
ECHO  ----------------------------------
ECHO     Ustvarjam ogrodje aplikacije
ECHO  ----------------------------------
ECHO.
npx express-generator --view=ejs --force &&(

TIMEOUT /T 1 /NOBREAK

ECHO.
ECHO  --------------------------
ECHO     Nameščam posodobitve
ECHO  --------------------------
ECHO.
npm install &&(
npm audit fix --force &&(

ECHO.
ECHO  -----------------------------
ECHO     Nameščam modul za mysql
ECHO  -----------------------------
ECHO.
npm install mysql2 &&(

ECHO.
ECHO  ----------------------------
ECHO     Nameščam modul Nodemon
ECHO  ----------------------------
ECHO.
npm install --save-dev nodemon &&(

ECHO.
ECHO  -------------------------
ECHO     Nameščam modul CORS
ECHO  -------------------------
ECHO.
npm install cors &&(

ECHO.
ECHO  ---------------------------
ECHO     Nameščam modul bcrypt
ECHO  ---------------------------
ECHO.
npm install bcrypt &&(

ECHO.
ECHO  -------------------------
ECHO     Namestitev končana!
ECHO  -------------------------
ECHO.
ECHO  V datoteki "package.json" dodaj v element "scripts" še to vrstico:
ECHO      "dev": "nodemon ./bin/www" 
ECHO  Pazi na vejice na koncu vrstic!
ECHO.
ECHO  Strežnik z aplikacijo nato lahko zaženeš z "npm run dev"

PAUSE
)))))))))