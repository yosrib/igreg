<?php
namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * ProjectController
 *
 * @author
 *
 * @version
 *
 */
class ProjectController extends AbstractActionController
{

    /**
     * The default action - show the home page
     */
    public function indexAction()
    {
        // TODO Auto-generated ProjectController::indexAction() default action
        return new ViewModel();
    }
}