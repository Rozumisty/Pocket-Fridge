import styles from "./error-page.module.scss"
import {Link} from "react-router-dom";
export default function ErrorPage(){
    return (
        <div className={`${styles.errorContainer} container`}>
            <img src="https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678069-sign-error-512.png" alt="Error" className={styles.errorImg}/>
            <p className={styles.errorMessage}>Where did you find that link?</p>
            <p className={styles.errorMessage}>There's no page here :(</p>
            <p className={styles.errorMessage}>But you can still <Link to={'/'} className={styles.returnHome}>Return home</Link></p>
        </div>
    )
}