import React from 'react';
import ReactDOM from 'react-dom/client';
import {createBrowserRouter, RouterProvider} from "react-router-dom"
import './styles.scss';
import MainLayout from "./components/shared/main-layout/main-layout";
import ErrorPage from "./components/pages/error-page/error-page";
import HomePage from "./components/pages/home-page/home-page";
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCy4INwnYRB8ty2VhH49i9dLsXQX2Dvwa4",
    authDomain: "pocket-fridge-project.firebaseapp.com",
    projectId: "pocket-fridge-project",
    storageBucket: "pocket-fridge-project.appspot.com",
    messagingSenderId: "17742874976",
    appId: "1:17742874976:web:a30c8b7d9579e1cc103605",
    measurementId: "G-49593PEE5L"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

const router = createBrowserRouter([{
    path: "/",
    element: <MainLayout />,
    errorElement: <ErrorPage />,
    children: [
        {
            path: "/",
            element: <HomePage />
        }
    ]
}])

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <RouterProvider router={router}/>
);
