<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class GamerController extends AbstractController
{
    /**
     * @Route("/gamer", name="gamer")
     */
    public function index()
    {
        return $this->render('gamer/index.html.twig', [
            'controller_name' => 'GamerController',
        ]);
    }
}
