const {app,BrowserWindow,ipcMain,dialog}=require('electron');
const path=require('path');
const os=require('os');
const {startServer}=require('./server');
let win, server;
function localIPs(){return Object.values(os.networkInterfaces()).flat().filter(x=>x && x.family==='IPv4' && !x.internal).map(x=>x.address)}
function create(){win=new BrowserWindow({width:1280,height:850,minWidth:1050,minHeight:700,webPreferences:{preload:path.join(__dirname,'preload.js'),contextIsolation:true,nodeIntegration:false}});win.loadFile('index.html')}
app.whenReady().then(async()=>{server=await startServer(path.join(app.getPath('userData'),'gc-data'),8787);create();});
ipcMain.handle('server-info',()=>({port:8787,ips:localIPs()}));
ipcMain.handle('pick-image',async()=>{const r=await dialog.showOpenDialog(win,{properties:['openFile','multiSelections'],filters:[{name:'Images',extensions:['jpg','jpeg','png','webp']} ]}); return r.canceled?[]:r.filePaths});
app.on('window-all-closed',()=>{if(process.platform!=='darwin')app.quit()});
