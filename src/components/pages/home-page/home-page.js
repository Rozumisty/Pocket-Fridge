import styles from './home-page.module.scss'

const ourTeam = [
    {
        name: 'Yurii Demkiv',
        role: 'PM, DB Dev',
        imgUrl: '/Demkiv.jpg'
    },
    {
        name: 'Yurii Hulivatiy',
        role: 'Team Lead',
        imgUrl: '/Hulivatiy.jpg'
    },
    {
        name: 'Oleksandr Pidopryhora',
        role: 'Mobile Dev',
        imgUrl: '/Sanya.jpg'
    },
    {
        name: 'Ruslan Sydoruk',
        role: 'Web Developer',
        imgUrl: '/meXD.jpg'
    },
    {
        name: 'Bohdan Kuzhel',
        role: 'Backend Dev',
        imgUrl: '/Kuzhel.jpg'
    },
    {
        name: 'Oleh Fedor',
        role: 'AI Developer',
        imgUrl: ''
    }

]

const teamJSX = (name, role, img) => {
    return (
        <div className={styles.teamMember}>
            <img src={img.length > 0 ? img : 'Ubknown.png'} alt="Portrait"/>
            <h2>{name}</h2>
            <p>{role}</p>
        </div>
    )
}

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
            <h1 className={styles.teamTitle}>{'< Rozumisty Team >'}</h1>
            <div className={styles.teamContainer}>
                {ourTeam.map(r => {
                   return teamJSX(r.name, r.role, r.imgUrl)
                })}
            </div>
        </div>
    )
}