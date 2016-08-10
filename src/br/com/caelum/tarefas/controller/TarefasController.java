package br.com.caelum.tarefas.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.TarefaDao;
import br.com.caelum.tarefas.dao.TarefasDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Transactional
@Controller
public class TarefasController{
	
	@Autowired
	TarefasDao daos;
	
	private final TarefaDao dao;

	@Autowired
	public TarefasController(TarefaDao dao) {
		this.dao = dao;
	}

	
	///////
	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}
	
	///////
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		
		if(result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}

		System.out.println("Adicionando tarefa...");
		//TarefaDao dao = new TarefaDao();
		dao.adiciona(tarefa);
		System.out.println("Tarefa adicionada.");
		return "tarefa/adicionada";
	}
	
	///////
	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		//TarefaDao dao = new TarefaDao();
		model.addAttribute("tarefas", dao.lista());
		
		return "tarefa/lista";
	}
	
	//////
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		//TarefaDao dao = new TarefaDao();
		System.out.println("Removendo tarefa...");
		dao.remove(tarefa);
		System.out.println("Tarefa removida.");
		return "redirect:listaTarefas";
	}
	
	//////
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
		//TarefaDao dao = new TarefaDao();
		model.addAttribute("tarefa", dao.buscaPorId(id));
		
		return "tarefa/mostra";
	}
	
	//////
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {
		//TarefaDao dao = new TarefaDao();
		System.out.println("Alterando tarefa...");
		dao.altera(tarefa);
		System.out.println("Tarefa alterada.");
		return "redirect:listaTarefas";
	}
	
	//////
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
		//TarefaDao dao = new TarefaDao();
		System.out.println("Finalizando tarefa...");
		dao.finaliza(id);
		System.out.println("Tarefa finalizada.");
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/finalizada";
	}
	
}
