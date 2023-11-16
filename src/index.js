import React from 'react';
import ReactDOM from 'react-dom/client';
import {createBrowserRouter, RouterProvider} from "react-router-dom"
import './styles.scss';
import MainLayout from "./components/shared/main-layout/main-layout";
import ErrorPage from "./components/pages/error-page/error-page";
import HomePage from "./components/pages/home-page/home-page";

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
