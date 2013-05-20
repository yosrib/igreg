<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/Album for the canonical source repository
 * @copyright Copyright (c) 2005-2012 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Album\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Album\Model\AlbumTable;


class AlbumController extends AbstractActionController{

    protected $albumTable;

    public function indexAction(){
        return new ViewModel(array(
            'albums' => $this->getAlbumTable()->fetchAll(),
        ));
    }
    
    public function addAction(){
        
    }
    
    public function editAction(){
        
    }
    
    public function deleteAction(){
        
    }
    
    public function getAlbumTable(){
    	if (!$this->albumTable) {
    		$sm = $this->getServiceLocator();
    		$this->albumTable = $sm->get('album-table');
    	}
    	return $this->albumTable;
    }
    
    public function fooAction()
    {
        // This shows the :controller and :action parameters in default route
        // are working when you browse to /album/album/foo
        return array();
    }
}
