function kubeuse -a 'context' --wraps "kubectl config use-context"
   if test -n "$context"
      kubectl config use-context $context
   else 
      echo "Changes the current kubernetes context in the kubeconfig file"
      set_color -o red; echo "Please provide a context to use"; set_color normal
      echo "Listing the available contexts"
      kubectl config get-contexts
   end
end
