using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class T2_Sphere : MonoBehaviour
{
    void Start()
    {
        
    }

    void Update()
    {
        Shader.SetGlobalVector("_Position", transform.position); 
    }
}
