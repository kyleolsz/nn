local GradientReversal, parent = torch.class('nn.GradientReversal', 'nn.Module')

function GradientReversal:__init(lambda)
   lambda = lambda or 1
   parent.__init(self)
   self.lambda = lambda
end

function GradientReversal:setLambda(lambda)
  self.lambda = lambda
end

function GradientReversal:updateOutput(input)
   self.output:set(input)
   return self.output
end

function GradientReversal:updateGradInput(input, gradOutput)
   self.gradInput:resizeAs(gradOutput)
   self.gradInput:copy(gradOutput)
   self.gradInput:mul(-self.lambda)
   return self.gradInput
end
