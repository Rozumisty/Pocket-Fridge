import styles from './home-page.module.scss'
export default function HomePage() {
    return (
        <div className={`container ${styles.container}`}>
            <div className={styles.fridgeContainer}>
                <img src="/banner-2.png" alt="Pocket Fridge" className={styles.fridgeImg}/>
                <h1>Pocket Fridge</h1>
                <h2>Keep Your fridge in Your pocket!</h2>
                <span>
                    A mobile grocery tracking app – an all-in-one solution for organized and effortless kitchen management.
                    Track food expiration dates and discover personalized recipes without any headache!
                </span>
            </div>
        </div>
    )
}