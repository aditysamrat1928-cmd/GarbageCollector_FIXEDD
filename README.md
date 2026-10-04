# Garbage Collector - Connected LAN Windows App

This build is designed for a no-third-party local-network deployment.

## How it connects
Run the same app on the Manager Windows PC. The embedded server listens on port 8787 on the LAN. The app displays the Manager PC LAN IP at the top. On a Customer PC, enter the Manager PC address (for example `192.168.1.10:8787`) on the login screen. The address is saved for future use. The Manager PC must allow TCP port 8787 through Windows Firewall on the private network.

For a true internet-wide deployment, a hosted backend/domain is required; this version deliberately avoids third-party services.

## Windows build
On Windows with Node.js installed:
1. `npm install`
2. `npm run dist:win`
3. Run the generated NSIS installer or portable EXE from `dist`.

Manager demo:
manager@garbagecollector.local / Manager@123
