using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; 

public class MainMenu : MonoBehaviour
{
    private GameObject player;

    public void Start()
    {
        Time.timeScale = 1f;
        player = GameObject.FindGameObjectWithTag("Player");
    }

    public void Update()
    {
        if(Input.GetKeyDown(KeyCode.X))
        {
            PlayerPrefs.DeleteAll();
        }
    }

    public void Playgame ()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
     }

    public void QuitGame()
    {
        Application.Quit(); 
    }

    public void Credits()
    {
        SceneManager.LoadScene("Credits");
    }

    public void BackToMain()
    {
        SceneManager.LoadScene("Menu");
    }
}
