<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ChromebookController extends AbstractController
{
    /**
     * @Route("/chromebook", name="chromebook")
     */
    public function index()
    {
        return $this->render('chromebook/chromebook.html.twig', [
            'controller_name' => 'ChromebookController',
        ]);
    }
}
