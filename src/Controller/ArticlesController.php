<?php

namespace App\Controller;

use App\Entity\Articles;
use App\Entity\Commentaires;
use App\Form\AjoutArticleFormType;
use App\Form\CommentaireFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class ArticlesController extends AbstractController
{
    /**
     * @Route("/accueil", name="accueil")
     */
    public function index()
    {
        $articles = $this->getDoctrine()->getRepository(Articles::class)->findAll();
        dump($articles[0]);

        return $this->render('accueil/index.html.twig', [
            'articles' => $articles,
        ]);
    }

    /**
     * @Route("/article/{slug}", name="article")
     */
    public function article($slug, Request $request){
        $article = $this->getDoctrine()->getRepository(Articles::class)->findOneBy([
            'slug' => $slug
        ]);

        if(!$article){
            throw $this->createNotFoundException("L'article recherché n'existe pas");
        }

        // On instancie l'entité Commentaires
        $commentaire = new Commentaires();

        // Nous créons l'objet formulaire
        $form = $this->createForm(CommentaireFormType::class, $commentaire);

        // On récupère les données saisies
        $form->handleRequest($request);

        // On vérifie si le formulaire a été envoyé et si les données sont valides
        if($form->isSubmitted() && $form->isValid()){
            // Ici le formulaire a été envoyé et les données sont valides
            $commentaire->setArticles($article);

            $commentaire->setCreatedAt(new \DateTime('now'));

            // On instancie Doctrine
            $doctrine = $this->getDoctrine()->getManager();

            // On hydrate $commentaire
            $doctrine->persist($commentaire);

            // On écrit dans la base de données
            $doctrine->flush();
        }

        return $this->render('articles/article.html.twig', [
            'article' => $article,
            'commentForm' => $form->createView()
        ]);
    }

}
