<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class WindowsController extends AbstractController
{
    /**
     * @Route("/windows", name="windows")
     */
    public function index()
    {
        return $this->render('windows/index.html.twig', [
            'controller_name' => 'WindowsController',
        ]);
    }
}
