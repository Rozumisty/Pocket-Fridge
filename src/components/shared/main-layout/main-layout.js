import {Outlet} from "react-router-dom";
import styles from "./main-layout.module.scss"

export default function MainLayout() {
    return (<>
        <div className={styles.navbar}>
            <div className={`container ${styles.container}`}>
                <div className={styles.logoContainer}>
                    <img src="/temp-logo.png" alt="logo" className={styles.logo}/>
                    <p className={styles.logoTitle}>Pocket Fridge</p>
                </div>
                <a href="https://youtu.be/dQw4w9WgXcQ?si=rQvEvdOfaCrMgRPx"
                   target={"_blank"}
                   rel="noreferrer"
                   className={styles.downloadLink}
                >Download
                    app</a>
            </div>

        </div>
        <Outlet/>
    </>)
}