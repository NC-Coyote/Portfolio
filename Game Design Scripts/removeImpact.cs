using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class removeImpact : MonoBehaviour
{
    void Start()
    {
        StartCoroutine(cleanUp());
    }
    
    // delete the impact effect after it has played its animation (after 0.25 seconds)
    IEnumerator cleanUp()
    {
        yield return new WaitForSeconds(0.25f);

        Destroy(gameObject);
    }
}
