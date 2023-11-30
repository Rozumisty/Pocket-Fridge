import {Outlet} from "react-router-dom";
import styles from "./main-layout.module.scss"
import InstagramIcon from '@mui/icons-material/Instagram';
import {Facebook, LinkedIn} from "@mui/icons-material";

export default function MainLayout() {
    return (<>
        <div className={`${styles.navbar} ${styles.layout}`}>
            <div className={`container ${styles.container}`}>
                <div className={styles.logoContainer}>
                    <img src="/logo.ico" alt="logo" className={styles.logo}/>
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
        <div className={`${styles.footer} ${styles.layout}`}>
            <div className={`container ${styles.container}`}>
                <p>© Rozumisty 2023</p>
                <div className={styles.socials}>
                    <a
                        href="https://youtu.be/dQw4w9WgXcQ?si=rQvEvdOfaCrMgRPx"
                        target={"_blank"}
                        rel="noreferrer"
                    ><InstagramIcon className={styles.socialIcon}/></a>
                    <a
                        href="https://youtu.be/dQw4w9WgXcQ?si=rQvEvdOfaCrMgRPx"
                        target={"_blank"}
                        rel="noreferrer"
                    ><Facebook className={styles.socialIcon}/></a>
                    <a
                        href="https://youtu.be/dQw4w9WgXcQ?si=rQvEvdOfaCrMgRPx"
                        target={"_blank"}
                        rel="noreferrer"
                    ><LinkedIn className={styles.socialIcon}/></a>
                </div>
            </div>
        </div>
    </>)
}