<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class MacbookController extends AbstractController
{
    /**
     * @Route("/macbook", name="macbook")
     */
    public function index()
    {
        return $this->render('macbook/macbook.html.twig', [
            'controller_name' => 'MacbookController',
        ]);
    }
}
