using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class screenFade : MonoBehaviour
{
    public Image fade;

    private int buildIndex;

    void Start()
    {
        buildIndex = SceneManager.GetActiveScene().buildIndex;
        fade.canvasRenderer.SetAlpha(0.0f);

        if (buildIndex == 0)
        {
            StartCoroutine(Wait());
        }
    }

    void FadeIn()
    {
        fade.CrossFadeAlpha(1, 1, false);
    }

    IEnumerator Wait()
    {
        yield return new WaitForSeconds(2f);
        FadeIn();
        yield return new WaitForSeconds(1.5f);
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
        StopCoroutine(Wait());
    }
}
