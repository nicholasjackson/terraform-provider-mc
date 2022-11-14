package main

import (
	"path"
	"path/filepath"

	"cdk.tf/go/stack/generated/nicholasjackson/mc"
	"github.com/aws/constructs-go/constructs/v10"
	"github.com/aws/jsii-runtime-go"
	"github.com/hashicorp/terraform-cdk-go/cdktf"
)

func NewMyStack(scope constructs.Construct, id string) cdktf.TerraformStack {
	stack := cdktf.NewTerraformStack(scope, &id)

  mc.NewMcProvider(stack, jsii.String("minecraft"), &mc.McProviderConfig{ 
    Endpoint: jsii.String("http://workshop.hashicraft.com:9090"),
    ApiKey: jsii.String("supertopsecret"),
  })

  busPath,_ := filepath.Abs(path.Join(".","bus.zip"))
  mc.NewSchema(stack, jsii.String("bus"), &mc.SchemaConfig{ 
    X: jsii.Number(-1255),
    Y: jsii.Number(24),
    Z: jsii.Number(130),
    Rotation: jsii.Number(0),
    Schema: jsii.String(busPath),
  })

	return stack
}

func main() {
	app := cdktf.NewApp(nil)

	NewMyStack(app, "cdktf-go")

	app.Synth()
}
